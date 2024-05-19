package com.workrelax.workrelaxapp.announcement;

import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AnnouncementConfig {

    @Bean
    CommandLineRunner commandLineRunner(AnnouncementRepository repository) {
        return args -> {
            Announcement announcement0 = new Announcement(
                "Sprzedam mieszkanie",
                "Superowy kwadrat, kupuj",
                "https://imgur.com/gallery/face-after-jokes-i-share-fall-flat-xv0Q6Z2"
            );
            Announcement announcement1 = new Announcement(
                "Erasmus",
                "Przyjezdzaja studenci z Afryki",
                "https://imgur.com/gallery/miao-miao-nibba-pcpXb8U"
            );

            repository.saveAll(
                List.of(announcement0, announcement1)
            );
        };
    }
}
