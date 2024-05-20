package com.workrelax.workrelaxapp.user;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;

import com.workrelax.workrelaxapp.tools.ApiTools;

@Service
public class UserProfileService {
    private final UserProfileRepository userProfileRepository;
    private final ApiTools apiTools = new ApiTools();

    @Autowired
    public UserProfileService(UserProfileRepository userProfileRepository) {
        this.userProfileRepository = userProfileRepository;
    }

    // get all users method + api key validation
    public List<UserProfile> getUsers(String key) {
        if (key.isEmpty()) {
            throw new IllegalStateException("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new IllegalStateException("Provided API key is incorrect!");
        }
        return userProfileRepository.findAll();
    }

    public void addNewUser(String key, UserProfile user) {
        if (key.isEmpty()) {
            throw new IllegalStateException("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new IllegalStateException("Provided API key is incorrect!");
        }
        Optional<UserProfile> userOptional = userProfileRepository.findUserByEmail(user.getEmail());
        if(userOptional.isPresent()) {
            throw new IllegalStateException("User with email " + user.getEmail() + " already exists!");
        }
        
        userProfileRepository.save(user);
    }

    public void deleteUser(Long userId) {
        boolean userExists = userProfileRepository.existsById(userId);
        if (!userExists) {
            throw new IllegalStateException("User with ID " + userId + " does not exist!");
        }
        userProfileRepository.deleteById(userId);
    }

    @Transactional
    public void updateUser(Long userId, String name, String surname, String email, String password, List<Long> friendlistIds, Long userplanId) {
        UserProfile user = userProfileRepository.findById(userId).orElseThrow(() -> new IllegalStateException("User with ID " + userId + " does not exist!"));

        // Changing name
        if(name != null && name.length() > 0 && !Objects.equals(user.getName(), name)) {
            user.setName(name);
        }

        // Changing surname
        if (surname != null && surname.length() > 0 && !Objects.equals(user.getSurname(), surname)) {
            user.setSurname(surname);
        }

        // Changing email
        if (email != null && email.length() > 0 && !Objects.equals(user.getEmail(), email)) {
            Optional<UserProfile> userOptional = userProfileRepository.findUserByEmail(email);
            if (userOptional.isPresent()) {
                throw new IllegalStateException("User with email " + email + " already exists!");
            }
            user.setEmail(email);
        }

        // Changing password + adjusting minimal password length
        if (password != null && password.length() > 0 && !Objects.equals(user.getPassword(), password)) {
            if (password.length() < 6) {
                throw new IllegalStateException("Password " + password + " is too short! Minimum is 6 characters.");
            }
            user.setPassword(password);
        }

        // Changing / updating friendlist
        if (friendlistIds != null && !friendlistIds.isEmpty() && !Objects.equals(user.getFriendlist(), friendlistIds)) {
            user.setFriendlist(friendlistIds);
        }

        // Changing userplan ID
        if (userplanId >= 0 && !Objects.equals(user.getUserplan(), userplanId)) {
            Optional<UserProfile> userOptional = userProfileRepository.findUserByUserplan(userplanId);
            if (userOptional.isPresent()) {
                throw new IllegalStateException("There is an existing user with plan ID " + userplanId + "!");
            }
            user.setUserplan(userplanId);
        }
    }
}
