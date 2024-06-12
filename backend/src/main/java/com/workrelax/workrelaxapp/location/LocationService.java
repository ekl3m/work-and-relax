package com.workrelax.workrelaxapp.location;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workrelax.workrelaxapp.tools.ApiTools;
import com.workrelax.workrelaxapp.tools.Exceptions.*;

import jakarta.transaction.Transactional;

@Service
public class LocationService {
    private final LocationRepository locationRepository;
    private final ApiTools apiTools = new ApiTools();

    @Autowired
    public LocationService(LocationRepository locationRepository) {
        this.locationRepository = locationRepository;
    }

    // get all events method + api key validation
    public List<Location> getLocations(String key) throws InvalidApiKey, ApiKeyNotProvided {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }
        return locationRepository.findAll();
    }

    public void addNewLocation(String key, Location location) throws InvalidApiKey, ApiKeyNotProvided, LocationAlreadyExists {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        Optional<Location> locationOptional = locationRepository.findLocationByCoordinates(location.getLocation_X(), location.getLocation_Y());
        if(locationOptional.isPresent()) {
            throw new LocationAlreadyExists("Location with coordinates (X:" + location.getLocation_X() + ", Y:" + location.getLocation_Y() + ") already exists!");
        }
        
        locationRepository.save(location);
    }

    public void deleteLocation(String key, Long locationId) throws InvalidApiKey, ApiKeyNotProvided, LocationNotFound {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        boolean locationExists = locationRepository.existsById(locationId);
        if (!locationExists) {
            throw new LocationNotFound("Location with ID " + locationId + " does not exist!");
        }
        locationRepository.deleteById(locationId);
    }

    @Transactional
    public void updateLocation(String key, Long locationId, String name, String photo, Double location_X, Double location_Y, Boolean isRestaurant)
            throws InvalidApiKey, ApiKeyNotProvided, LocationAlreadyExists, LocationNotFound {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        Location location = locationRepository.findById(locationId)
                .orElseThrow(() -> new LocationNotFound("Location with ID " + locationId + " does not exist!"));

        // Changing name
        if (name != null && name.length() > 0 && !Objects.equals(location.getName(), name)) {
            location.setName(name);
        }

        // Changing photo
        if (photo != null && photo.length() > 0 && !Objects.equals(location.getPhoto(), photo)) {
            location.setPhoto(photo);
        }

        // Changing location_X
        if (location_X != 0 && !Objects.equals(location.getLocation_X(), location_X)) {
            location.setLocation_X(location_X);
        }

        // Changing location_Y
        if (location_Y != 0 && !Objects.equals(location.getLocation_Y(), location_Y)) {
            location.setLocation_Y(location_Y);
        }

        // Changing isRestaurant
        if (!Objects.equals(location.isRestaurant(), isRestaurant)) {
            location.setRestaurant(isRestaurant);
        }
    }
}
