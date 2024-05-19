package com.workrelax.workrelaxapp.user;

import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class UserProfileConfig {

    @Bean
    CommandLineRunner commandLineRunner(UserProfileRepository repository) {
        return args -> {
            UserProfile MariuszWyrwidab = new UserProfile(
                "Mariusz",
                "Wyrwidab",
                "m.wyrwidab@gmail.com",
                "DabWyrwi223",
                null,
                1L
            );
            UserProfile AdamMickiewicz = new UserProfile(
                "Adam",
                "Mickiewicz",
                "a.mic@wp.pl",
                "PanTadeuszDziady@2",
                null,
                2L
            );

            repository.saveAll(
                List.of(MariuszWyrwidab, AdamMickiewicz)
            );
        };
    }
}
