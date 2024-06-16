package com.workrelax.workrelaxapp.activity;

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
public class ActivityService {
    private final ActivityRepository activityRepository;
    ApiTools apiTools = new ApiTools();

    @Autowired
    public ActivityService(ActivityRepository activityRepository) {
        this.activityRepository = activityRepository;
    }

    // get all activities method + api key validation
    @Transactional
    public List<Activity> getActivities(String key) throws InvalidApiKey, ApiKeyNotProvided {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }
        return activityRepository.findAll();
    }

    @Transactional
    public void addNewActivity(String key, Activity activity) throws InvalidApiKey, ApiKeyNotProvided, ActivityAlreadyExists, DateInThePast {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        if (activity.getActivityDate().isBefore(LocalDateTime.now())) {
            throw new DateInThePast("Provided date " + activity.getActivityDate().toString() + " is in the past");
        }

        Optional<Activity> activityOptional = activityRepository.findActivityByTitle(activity.getTitle());
        if(activityOptional.isPresent()) {
            throw new ActivityAlreadyExists("Activity with title " + activity.getTitle() + " already exists!");
        }
        
        activityRepository.save(activity);
    }

    public void deleteActivity(String key, Long eventId) throws InvalidApiKey, ApiKeyNotProvided, ActivityNotFound {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        boolean eventExists = activityRepository.existsById(eventId);
        if (!eventExists) {
            throw new ActivityNotFound("Activity with ID " + eventId + " does not exist!");
        }
        activityRepository.deleteById(eventId);
    }

    @Transactional
    public void updateActivity(String key, Long activityId, String title, String description, String photo, LocalDateTime date) 
    throws InvalidApiKey, ApiKeyNotProvided, ActivityAlreadyExists, ActivityNotFound, DateInThePast {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        Activity activity = activityRepository.findById(activityId).orElseThrow(() -> new ActivityNotFound("Activity with ID " + activityId + " does not exist!"));

        // Changing title
        if(title != null && title.length() > 0 && !Objects.equals(activity.getTitle(), title)) {
            activity.setTitle(title);
        }

        // Changing description
        if (description != null && description.length() > 0 && !Objects.equals(activity.getDescription(), description)) {
            activity.setDescription(description);
        }

        // Changing photo
        if (photo != null && photo.length() > 0 && !Objects.equals(activity.getPhoto(), photo)) {
            activity.setPhoto(photo);
        }

        // Changing date
        if (date != null && !Objects.equals(activity.getActivityDate(), date)) {
            if (date.isBefore(LocalDateTime.now())) {
                throw new DateInThePast("Provided date " + date.toString() + " is in the past");
            }

            activity.setActivityDate(date);
        }
    }
}
