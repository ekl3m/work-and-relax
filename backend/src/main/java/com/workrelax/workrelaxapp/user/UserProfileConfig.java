package com.workrelax.workrelaxapp.user;

import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class UserProfileConfig {

    @Bean
    CommandLineRunner userCommandLineRunner(UserProfileRepository repository) {
        return args -> {
            UserProfile MariuszWyrwidab = new UserProfile(
                "Mariusz",
                "Wyrwidab",
                "Admin",
                "admin",
                null,
                1L,
                true,
                false,
                true,
                100000
            );
            UserProfile AdamMickiewicz = new UserProfile(
                "Adam",
                "Mickiewicz",
                "a.mic@wp.pl",
                "PanTadeuszDziady@2",
                null,
                2L,
                false,
                false,
                true,
                100001
            );

            repository.saveAll(
                List.of(MariuszWyrwidab, AdamMickiewicz)
            );
        };
    }
}
