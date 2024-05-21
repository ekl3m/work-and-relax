package com.workrelax.workrelaxapp.plan;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface PlanRepository extends JpaRepository<Plan, Long> {

    @Query("SELECT p FROM Plan p WHERE p.OwnerID = :OwnerID")
    Optional<Plan> findPlanByOwnerId(Long OwnerID);
}
