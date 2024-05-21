package com.workrelax.workrelaxapp.plan;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workrelax.workrelaxapp.tools.ApiTools;
import com.workrelax.workrelaxapp.tools.Exceptions.*;

import jakarta.transaction.Transactional;

@Service
public class PlanService {
    private final PlanRepository planRepository;
    private final ApiTools apiTools = new ApiTools();

    @Autowired
    public PlanService(PlanRepository planRepository) {
        this.planRepository = planRepository;
    }

    // get all events method + api key validation
    public List<Plan> getPlans(String key) throws InvalidApiKey, ApiKeyNotProvided {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }
        return planRepository.findAll();
    }

    public void addNewPlan(String key, Plan plan) throws InvalidApiKey, ApiKeyNotProvided, PlanAlreadyExists {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        Optional<Plan> planOptional = planRepository.findPlanByOwnerId(plan.getOwnerID());
        if(planOptional.isPresent()) {
            throw new PlanAlreadyExists("Plan with ownerID " + plan.getOwnerID() + " already exists!");
        }
        
        planRepository.save(plan);
    }

    public void deletePlan(String key, Long planId) throws InvalidApiKey, ApiKeyNotProvided, PlanNotFound {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        boolean planExists = planRepository.existsById(planId);
        if (!planExists) {
            throw new PlanNotFound("Plan with ID " + planId + " does not exist!");
        }
        planRepository.deleteById(planId);
    }

    @Transactional
    public void updatePlan(String key, Long planId, boolean isNull, Long ownerId, List<Long> listOfActivitiesIDs) 
    throws InvalidApiKey, ApiKeyNotProvided, PlanAlreadyExists, PlanNotFound {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        Plan plan = planRepository.findById(planId).orElseThrow(() -> new PlanNotFound("Plan with ID " + planId + " does not exist!"));

        // Changing ownerId
        if(ownerId >= 0 && !Objects.equals(plan.getOwnerID(), ownerId)) {
            // Optional<UserProfile> userOptional = planRepository.findUserByUserplan(ownerId);
            // if (userOptional.isPresent()) {
            //     throw new UserProfileAlreadyExists("There is an existing user with plan ID " + userplanId + "!");
            // }
            plan.setOwnerID(ownerId);
        }

        // Changing list of activities
        if (listOfActivitiesIDs != null && listOfActivitiesIDs.isEmpty() && !Objects.equals(plan.getListOfActivitiesIDs(), listOfActivitiesIDs)) {
            plan.setListOfActivities(listOfActivitiesIDs);
        }
    }
}
