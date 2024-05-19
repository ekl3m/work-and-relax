package com.workrelax.workrelaxapp.user;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserProfileRepository extends JpaRepository<UserProfile, Long> {

    @Query("SELECT s FROM UserProfile u WHERE u.email = ?1")
    Optional<UserProfile> findUserByEmail(String email);

    @Query("SELECT s FROM UserProfile u WHERE u.userplanid = ?1")
    Optional<UserProfile> findUserByUserplan(Long userplanid);
}
