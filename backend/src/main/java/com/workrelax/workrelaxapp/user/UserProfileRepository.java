package com.workrelax.workrelaxapp.user;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserProfileRepository extends JpaRepository<UserProfile, Long> {

    @Query("SELECT u FROM UserProfile u WHERE u.Email = :Email")
    Optional<UserProfile> findUserByEmail(String Email);

    @Query("SELECT u FROM UserProfile u WHERE u.UserplanID = :UserplanID")
    Optional<UserProfile> findUserByUserplan(Long UserplanID);
}
