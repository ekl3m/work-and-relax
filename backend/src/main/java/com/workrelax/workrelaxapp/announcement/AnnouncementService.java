package com.workrelax.workrelaxapp.announcement;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workrelax.workrelaxapp.tools.Exceptions.*;
import com.workrelax.workrelaxapp.tools.ApiTools;

import jakarta.transaction.Transactional;

@Service
public class AnnouncementService {
    private final AnnouncementRepository announcementRepository;
    ApiTools apiTools = new ApiTools();

    @Autowired
    public AnnouncementService(AnnouncementRepository announcementRepository) {
        this.announcementRepository = announcementRepository;
    }

    // get all announcements method + api key validation
    @Transactional
    public List<Announcement> getAnnouncements(String key) throws InvalidApiKey, ApiKeyNotProvided {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }
        return announcementRepository.findAll();
    }

    @Transactional
    public void addNewAnnouncement(String key, Announcement announcement) throws InvalidApiKey, ApiKeyNotProvided, AnnouncementAlreadyExists {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        Optional<Announcement> eventOptional = announcementRepository.findAnnouncementByTitle(announcement.getTitle());
        if(eventOptional.isPresent()) {
            throw new AnnouncementAlreadyExists("Announcement with title " + announcement.getTitle() + " already exists!");
        }
        
        announcementRepository.save(announcement);
    }

    public void deleteAnnouncement(String key, Long announcementId) throws InvalidApiKey, ApiKeyNotProvided, AnnouncementNotFound {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        boolean announcementExists = announcementRepository.existsById(announcementId);
        if (!announcementExists) {
            throw new AnnouncementNotFound("Announcement with ID " + announcementId + " does not exist!");
        }
        announcementRepository.deleteById(announcementId);
    }

    @Transactional
    public void updateAnnouncement(String key, Long announcementId, String title, String description, String photo) 
    throws InvalidApiKey, ApiKeyNotProvided, AnnouncementAlreadyExists, AnnouncementNotFound {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        Announcement announcement = announcementRepository.findById(announcementId).orElseThrow(() -> new AnnouncementNotFound("Announcement with ID " + announcementId + " does not exist!"));

        // Changing title
        if(title != null && title.length() > 0 && !Objects.equals(announcement.getTitle(), title)) {
            announcement.setTitle(title);
        }

        // Changing description
        if (description != null && description.length() > 0 && !Objects.equals(announcement.getDescription(), description)) {
            announcement.setDescription(description);
        }

        // Changing photo
        if (photo != null && photo.length() > 0 && !Objects.equals(announcement.getPhoto(), photo)) {
            announcement.setPhoto(photo);
        }
    }
}
