package com.workrelax.workrelaxapp.event;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workrelax.workrelaxapp.tools.Exceptions.*;
import com.workrelax.workrelaxapp.tools.ApiTools;

import jakarta.transaction.Transactional;

@Service
public class EventService {
    private final EventRepository eventRepository;
    private final ApiTools apiTools = new ApiTools();

    @Autowired
    public EventService(EventRepository eventRepository) {
        this.eventRepository = eventRepository;
    }

    // get all events method + api key validation
    @Transactional
    public List<Event> getEvents(String key) throws InvalidApiKey, ApiKeyNotProvided {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }
        return eventRepository.findAll();
    }

    @Transactional
    public void addNewEvent(String key, Event event) throws InvalidApiKey, ApiKeyNotProvided, EventAlreadyExists, DateInThePast {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        if (event.getEventDate().isBefore(LocalDateTime.now())) {
            throw new DateInThePast("Provided date " + event.getEventDate().toString() + " is in the past");
        }

        Optional<Event> eventOptional = eventRepository.findEventByTitle(event.getTitle());
        if(eventOptional.isPresent()) {
            throw new EventAlreadyExists("Event with title " + event.getTitle() + " already exists!");
        }
        
        eventRepository.save(event);
    }

    public void deleteEvent(String key, Long eventId) throws InvalidApiKey, ApiKeyNotProvided, EventNotFound {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        boolean eventExists = eventRepository.existsById(eventId);
        if (!eventExists) {
            throw new EventNotFound("Event with ID " + eventId + " does not exist!");
        }
        eventRepository.deleteById(eventId);
    }

    @Transactional
    public void updateEvent(String key, Long eventId, String title, String description, String photo, LocalDateTime date) 
    throws InvalidApiKey, ApiKeyNotProvided, EventAlreadyExists, EventNotFound, DateInThePast {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        Event event = eventRepository.findById(eventId).orElseThrow(() -> new EventNotFound("Event with ID " + eventId + " does not exist!"));

        // Changing title
        if(title != null && title.length() > 0 && !Objects.equals(event.getTitle(), title)) {
            event.setTitle(title);
        }

        // Changing description
        if (description != null && description.length() > 0 && !Objects.equals(event.getDescription(), description)) {
            event.setDescription(description);
        }

        // Changing photo
        if (photo != null && photo.length() > 0 && !Objects.equals(event.getPhoto(), photo)) {
            event.setPhoto(photo);
        }

        // Changing date
        if (date != null && !Objects.equals(event.getEventDate(), date)) {
            if (date.isBefore(LocalDateTime.now())) {
                throw new DateInThePast("Provided date " + date.toString() + " is in the past");
            }

            event.setEventDate(date);
        }
    }
}
