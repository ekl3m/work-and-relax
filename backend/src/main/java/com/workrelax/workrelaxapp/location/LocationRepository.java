package com.workrelax.workrelaxapp.location;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface LocationRepository extends JpaRepository<Location, Long> {

    @Query("SELECT l FROM Location l WHERE (l.Location_X = :Location_X AND l.Location_Y = :Location_Y)")
    Optional<Location> findLocationByCoordinates(Double Location_X, Double Location_Y);
}
