package com.workrelax.workrelaxapp.announcement;

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
@RequestMapping(path = "api/v1/announcement")
public class AnnouncementController {
    private final AnnouncementService announcementService;

    @Autowired
    public AnnouncementController(AnnouncementService announcementService) {
        this.announcementService = announcementService;
    }
    
    @GetMapping(path = "/all")
    public List<Announcement> getAnnouncements(@RequestParam(name = "key", defaultValue = "") String key) throws InvalidApiKey, ApiKeyNotProvided {
        return announcementService.getAnnouncements(key);
    }

    @PostMapping(path = "/new")
    public void createAnnouncement(@RequestParam(name = "key", defaultValue = "") String key, @RequestBody Announcement announcement)
    throws InvalidApiKey, ApiKeyNotProvided, AnnouncementAlreadyExists {
        announcementService.addNewAnnouncement(key, announcement);
    }

    @DeleteMapping(path = "{announcementId}")
    public void deleteAnnouncement(@PathVariable("announcementId") Long announcementId, @RequestParam(name = "key", defaultValue = "") String key) 
    throws InvalidApiKey, ApiKeyNotProvided, AnnouncementNotFound {
        announcementService.deleteAnnouncement(key, announcementId);
    }

    @PutMapping(path = "/edit/{announcementId}")
    public void updateAnnouncement(@PathVariable("announcementId") Long announcementId,
    @RequestParam(name = "key", defaultValue = "", required = true) String key, 
    @RequestParam(required = false) String title, 
    @RequestParam(required = false) String description,
    @RequestParam(required = false) String photo) 
    throws InvalidApiKey, ApiKeyNotProvided, AnnouncementAlreadyExists, AnnouncementNotFound {
        announcementService.updateAnnouncement(key, announcementId, title, description, photo);
    }
    
}
