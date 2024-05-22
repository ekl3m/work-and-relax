package com.workrelax.workrelaxapp.activity;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.workrelax.workrelaxapp.tools.Exceptions.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping(path = "api/v1/activity")
public class ActivityController {
    private final ActivityService activityService;

    @Autowired
    public ActivityController(ActivityService activityService) {
        this.activityService = activityService;
    }
    
    @GetMapping(path = "/all")
    public List<Activity> getActivities(@RequestParam(name = "key", defaultValue = "") String key) throws InvalidApiKey, ApiKeyNotProvided {
        return activityService.getActivities(key);
    }

    @PostMapping(path = "/new")
    public void createActivity(@RequestParam(name = "key", defaultValue = "") String key, @RequestBody Activity activity)
    throws InvalidApiKey, ApiKeyNotProvided, ActivityAlreadyExists, DateInThePast {
        activityService.addNewActivity(key, activity);
    }

    @DeleteMapping(path = "{activityId}")
    public void deleteActivity(@PathVariable("activityId") Long activityId, @RequestParam(name = "key", defaultValue = "") String key) 
    throws InvalidApiKey, ApiKeyNotProvided, ActivityNotFound {
        activityService.deleteActivity(key, activityId);
    }

    @PutMapping(path = "/edit/{activityId}")
    public void updateActivity(@PathVariable("activityId") Long activityId,
    @RequestParam(name = "key", defaultValue = "", required = true) String key, 
    @RequestParam(required = false) String title, 
    @RequestParam(required = false) String description,
    @RequestParam(required = false) String photo,
    @RequestParam(required = false) LocalDateTime date) 
    throws InvalidApiKey, ApiKeyNotProvided, ActivityAlreadyExists, ActivityNotFound, DateInThePast {
        activityService.updateActivity(key, activityId, title, description, photo, date);
    }
    
}
