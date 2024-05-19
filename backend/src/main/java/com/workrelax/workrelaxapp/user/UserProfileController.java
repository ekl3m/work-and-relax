package com.workrelax.workrelaxapp.user;

import java.util.List;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping(path = "api/v1/userprofile")
public class UserProfileController {
    private final UserProfileService userService;

    @Autowired
    public UserProfileController(UserProfileService userService) {
        this.userService = userService;
    }

    @GetMapping
    public List<UserProfile> getUsers() {
        return userService.getUsers();
    }

    @PostMapping
    public void registerNewUser(@RequestBody UserProfile user) {
        userService.addNewUser(user);
    }
}
