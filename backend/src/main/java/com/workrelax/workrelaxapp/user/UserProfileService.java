package com.workrelax.workrelaxapp.user;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserProfileService {
    private final UserProfileRepository userProfileRepository;

    @Autowired
    public UserProfileService(UserProfileRepository userProfileRepository) {
        this.userProfileRepository = userProfileRepository;
    }

    public List<UserProfile> getUsers() {
        return userProfileRepository.findAll();
    }

    public void addNewUser(UserProfile user) {
        Optional<UserProfile> userOptional = userProfileRepository.findUserByEmail(user.getEmail());
        if(userOptional.isPresent()) {
            throw new IllegalStateException("Email uzytkownika istnieje w bazie danych");
        }
        
        userProfileRepository.save(user);
    }
}
