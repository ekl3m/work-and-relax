package com.workrelax.workrelaxapp.plan;

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
@RequestMapping(path = "api/v1/plan")
public class PlanController {
    private final PlanService planService;

    @Autowired
    public PlanController(PlanService planService) {
        this.planService = planService;
    }
    
    @GetMapping(path = "/all")
    public List<Plan> getPlans(@RequestParam(name = "key", defaultValue = "") String key) throws InvalidApiKey, ApiKeyNotProvided {
        return planService.getPlans(key);
    }

    @PostMapping(path = "/new")
    public void createPlan(@RequestParam(name = "key", defaultValue = "") String key, @RequestBody Plan plan)
    throws InvalidApiKey, ApiKeyNotProvided, PlanAlreadyExists {
        planService.addNewPlan(key, plan);
    }

    @DeleteMapping(path = "{planId}")
    public void deletePlan(@PathVariable("planId") Long planId, @RequestParam(name = "key", defaultValue = "") String key) 
    throws InvalidApiKey, ApiKeyNotProvided, PlanNotFound {
        planService.deletePlan(key, planId);
    }

    @PutMapping(path = "/edit/{planId}")
    public void updatePlan(@PathVariable("planId") Long planId,
    @RequestParam(name = "key", defaultValue = "", required = true) String key, 
    @RequestParam(required = false) boolean isNull, 
    @RequestParam(required = false, defaultValue = "-1") Long ownerId,
    @RequestParam(required = false) List<Long> listOfActivitiesIDs) 
    throws InvalidApiKey, ApiKeyNotProvided, PlanAlreadyExists, PlanNotFound {
        planService.updatePlan(key, planId, isNull, ownerId, listOfActivitiesIDs);
    }
}
