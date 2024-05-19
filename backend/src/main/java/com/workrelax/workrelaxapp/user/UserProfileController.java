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

    @GetMapping
    public List<UserProfile> getUsers() {
        return userService.getUsers();
    }

    @PostMapping
    public void registerUser(@RequestBody UserProfile user) {
        userService.addNewUser(user);
    }

    @DeleteMapping(path = "{userProfileId}")
    public void deleteUser(@PathVariable("userProfileId") Long userId) {
        userService.deleteUser(userId);
    }

    @PutMapping(path = "{userProfileId}")
    public void updateUser(@PathVariable("userProfileId") Long id, 
        @RequestParam(required = false) String name, 
        @RequestParam(required = false) String surname,
        @RequestParam(required = false) String email,
        @RequestParam(required = false) String password,
        @RequestParam(required = false) List<Long> friendlistIds,
        @RequestParam(required = false) Long userplanId) {
        userService.updateUser(id, name, surname, email, password, friendlistIds, userplanId);
    }
}
