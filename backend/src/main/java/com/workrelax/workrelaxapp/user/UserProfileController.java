package com.workrelax.workrelaxapp.user;

import java.util.List;

import org.springframework.web.bind.annotation.RestController;
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

    @GetMapping("/all")
    public List<UserProfile> getUsers(@RequestParam(name = "key", defaultValue = "") String key) {
        return userService.getUsers(key);
    }

    @PostMapping("/new")
    public void registerUser(@RequestParam(name = "key", defaultValue = "") String key, @RequestBody UserProfile user) {
        userService.addNewUser(key, user);
    }

    @DeleteMapping(path = "{userProfileId}")
    public void deleteUser(@PathVariable("userProfileId") Long userId) {
        userService.deleteUser(userId);
    }

    @PutMapping(path = "{userProfileId}")
    public void updateUser(@PathVariable("userProfileId") Long userId, 
        @RequestParam(required = false) String name, 
        @RequestParam(required = false) String surname,
        @RequestParam(required = false) String email,
        @RequestParam(required = false) String password,
        @RequestParam(required = false) List<Long> friendlistIds,
        @RequestParam(required = false) Long userplanId) {
        userService.updateUser(userId, name, surname, email, password, friendlistIds, userplanId);
    }
}
