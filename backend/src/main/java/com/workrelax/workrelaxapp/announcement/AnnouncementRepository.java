package com.workrelax.workrelaxapp.announcement;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface AnnouncementRepository extends JpaRepository<Announcement, Long> {

    @Query("SELECT a FROM Announcement a WHERE a.Title = :Title")
    Optional<Announcement> findAnnouncementByTitle(String Title);

}
