package com.workrelax.workrelaxapp.user;

import java.util.Arrays;
import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class UserProfileConfig {

    @Bean
    CommandLineRunner userCommandLineRunner(UserProfileRepository repository) {
        List<Long> friendList1 = Arrays.asList(2L);
        List<Long> friendList2 = Arrays.asList(1L);
        
        return args -> {
            UserProfile MariuszWyrwidab = new UserProfile(
                "Mariusz",
                "Wyrwidab",
                "Admin",
                "admin",
                friendList1,
                1L,
                true,
                false,
                true,
                100000,
                "https://as2.ftcdn.net/v2/jpg/02/42/00/07/1000_F_242000725_qiAf9SxzWQLLTRlk3yW6MCVs0iZWjaUP.jpg"
            );
            UserProfile AdamMickiewicz = new UserProfile(
                "Adam",
                "Mickiewicz",
                "a.mic@wp.pl",
                "PanTadeuszDziady@2",
                friendList2,
                2L,
                false,
                false,
                true,
                100001,
                "https://gryiksiazki.pl/storage/media/91c79b27-e056-4886-b6e4-abcf2dcd17a0/thumbnail/6axCDZZUrhDVi3wq5CABwPywpSB0KF/8a7395b05faac16c0095d81b59c81305.webp"
            );

            repository.saveAll(
                List.of(MariuszWyrwidab, AdamMickiewicz)
            );
        };
    }
}
