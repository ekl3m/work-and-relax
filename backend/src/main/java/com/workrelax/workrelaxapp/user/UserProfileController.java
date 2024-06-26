package com.workrelax.workrelaxapp.user;

import java.util.List;

import org.springframework.web.bind.annotation.RestController;

import com.workrelax.workrelaxapp.tools.Exceptions.ApiKeyNotProvided;
import com.workrelax.workrelaxapp.tools.Exceptions.InvalidApiKey;
import com.workrelax.workrelaxapp.tools.Exceptions.PasswordTooShort;
import com.workrelax.workrelaxapp.tools.Exceptions.UserProfileAlreadyExists;
import com.workrelax.workrelaxapp.tools.Exceptions.UserProfileNotFound;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PutMapping;


@RestController
@RequestMapping(path = "api/v1/userprofile")
public class UserProfileController {
    private final UserProfileService userService;

    @Autowired
    public UserProfileController(UserProfileService userService) {
        this.userService = userService;
    }

    @GetMapping(path = "/all")
    public List<UserProfile> getUsers(@RequestParam(name = "key", defaultValue = "") String key) throws InvalidApiKey, ApiKeyNotProvided {
        return userService.getUsers(key);
    }

    @GetMapping(path = "/byEmail")
    public UserProfile getUserByEmail(@RequestParam(name = "key", defaultValue = "") String key,
    @RequestParam(required = true) String email)
    throws InvalidApiKey, ApiKeyNotProvided, UserProfileNotFound {
        return userService.getUserByEmail(key, email);
    }

    @PostMapping(path = "/new")
    public void registerUser(@RequestParam(name = "key", defaultValue = "") String key, @RequestBody UserProfile user)
    throws InvalidApiKey, ApiKeyNotProvided, UserProfileAlreadyExists {
        userService.addNewUser(key, user);
    }

    @DeleteMapping(path = "/account/{userProfileId}")
    public void deleteUser(@PathVariable("userProfileId") Long userId, @RequestParam(name = "key", defaultValue = "") String key) 
    throws InvalidApiKey, ApiKeyNotProvided, UserProfileNotFound {
        userService.deleteUser(key, userId);
    }

    @PutMapping(path = "/edit/{userProfileId}")
    public void updateUser(@PathVariable("userProfileId") Long userId,
    @RequestParam(name = "key", defaultValue = "", required = true) String key, 
    @RequestParam(required = false) String name, 
    @RequestParam(required = false) String surname,
    @RequestParam(required = false) String email,
    @RequestParam(required = false) String password,
    @RequestParam(required = false) List<Long> friendlistIds,
    @RequestParam(required = false, defaultValue = "-1") Long userplanId,
    @RequestParam(required = false) Boolean isVerified,
    @RequestParam(required = false) Boolean isBanned,
    @RequestParam(required = false) Boolean isAdmin,
    @RequestParam(required = false, defaultValue = "-1") Integer verificationCode,
    @RequestParam(required = false) String photo)
    throws InvalidApiKey, ApiKeyNotProvided, UserProfileAlreadyExists, UserProfileNotFound, PasswordTooShort {
        userService.updateUser(key, userId, name, surname, email, password, friendlistIds, userplanId, isVerified, isBanned, isAdmin, verificationCode, photo);
    }
}
