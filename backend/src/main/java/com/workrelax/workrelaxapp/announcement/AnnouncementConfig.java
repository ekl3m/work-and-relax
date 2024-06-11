package com.workrelax.workrelaxapp.announcement;

import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AnnouncementConfig {

    @Bean
    CommandLineRunner announcementCommandLineRunner(AnnouncementRepository repository) {
        return args -> {
            Announcement announcement0 = new Announcement(
                "Sprzedam mieszkanie",
                "Superowy kwadrat, kupuj",
                "https://i.imgur.com/XGnp1VJ.jpeg"
            );
            Announcement announcement1 = new Announcement(
                "Erasmus",
                "Przyjezdzaja studenci z Afryki",
                "https://i.imgur.com/6Bk6UFr.jpeg"
            );

            repository.saveAll(
                List.of(announcement0, announcement1)
            );
        };
    }
}
