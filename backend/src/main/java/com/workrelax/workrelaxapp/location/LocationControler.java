package com.workrelax.workrelaxapp.location;

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
@RequestMapping(path = "api/v1/location")
public class LocationControler {
    private final LocationService locationService;

    @Autowired
    public LocationControler(LocationService locationService) {
        this.locationService = locationService;
    }

    @GetMapping(path = "/all")
    public List<Location> getLocations(@RequestParam(name = "key", defaultValue = "") String key)
            throws InvalidApiKey, ApiKeyNotProvided {
        return locationService.getLocations(key);
    }

    @PostMapping(path = "/new")
    public void createPlan(@RequestParam(name = "key", defaultValue = "") String key, @RequestBody Location location)
            throws InvalidApiKey, ApiKeyNotProvided, LocationAlreadyExists {
        locationService.addNewLocation(key, location);
    }

    @DeleteMapping(path = "{locationId}")
    public void deletePlan(@PathVariable("locationId") Long locationId,
            @RequestParam(name = "key", defaultValue = "") String key)
            throws InvalidApiKey, ApiKeyNotProvided, LocationNotFound {
        locationService.deleteLocation(key, locationId);
    }

    @PutMapping(path = "/edit/{locationId}")
    public void updatePlan(@PathVariable("locationId") Long locationId,
            @RequestParam(name = "key", defaultValue = "", required = true) String key,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String photo,
            @RequestParam(required = false, defaultValue = "0") Double location_X,
            @RequestParam(required = false, defaultValue = "0") Double location_Y,
            @RequestParam(required = false) Boolean isRestaurant)
            throws InvalidApiKey, ApiKeyNotProvided, LocationAlreadyExists, LocationNotFound {
        locationService.updateLocation(key, locationId, name, photo, location_X, location_Y, isRestaurant);
    }
}
