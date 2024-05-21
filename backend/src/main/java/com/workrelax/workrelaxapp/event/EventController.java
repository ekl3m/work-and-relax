package com.workrelax.workrelaxapp.event;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.web.bind.annotation.RestController;

import com.workrelax.workrelaxapp.tools.Exceptions.*;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping(path = "api/v1/event")
public class EventController {
    private final EventService eventService;

    @Autowired
    public EventController(EventService eventService) {
        this.eventService = eventService;
    }
    
    @GetMapping(path = "/all")
    public List<Event> getEvents(@RequestParam(name = "key", defaultValue = "") String key) throws InvalidApiKey, ApiKeyNotProvided {
        return eventService.getEvents(key);
    }

    @PostMapping(path = "/new")
    public void createEvent(@RequestParam(name = "key", defaultValue = "") String key, @RequestBody Event event)
    throws InvalidApiKey, ApiKeyNotProvided, EventAlreadyExists, DateInThePast {
        eventService.addNewEvent(key, event);
    }

    @DeleteMapping(path = "{eventId}")
    public void deleteEvent(@PathVariable("eventId") Long eventId, @RequestParam(name = "key", defaultValue = "") String key) 
    throws InvalidApiKey, ApiKeyNotProvided, EventNotFound {
        eventService.deleteEvent(key, eventId);
    }

    @PutMapping(path = "/edit/{eventId}")
    public void updateEvent(@PathVariable("eventId") Long eventId,
    @RequestParam(name = "key", defaultValue = "", required = true) String key, 
    @RequestParam(required = false) String title, 
    @RequestParam(required = false) String description,
    @RequestParam(required = false) String photo,
    @RequestParam(required = false) LocalDateTime date) 
    throws InvalidApiKey, ApiKeyNotProvided, EventAlreadyExists, EventNotFound, DateInThePast {
        eventService.updateEvent(key, eventId, title, description, photo, date);
    }
    
}
