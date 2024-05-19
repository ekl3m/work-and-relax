package com.workrelax.workrelaxapp.event;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Month;
import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class EventConfig {

    @Bean
    CommandLineRunner eventCommandLineRunner(EventRepository repository) {
        return args -> {
            Event event0 = new Event(
                "Festiwal piwa",
                "Wypij jak najwiecej piwa",
                "https://imgur.com/gallery/im-just-gonna-leave-this-here-t5B2kTQ",
                LocalDateTime.of(LocalDate.of(2024, Month.JULY, 15), LocalTime.of(15, 0, 0))
            );
            Event event1 = new Event(
                "Comicon",
                "Przebierz sie za ulubione postacie z komiksow",
                "https://imgur.com/gallery/new-york-comicon-day-3-KupL0Er",
                LocalDateTime.of(LocalDate.of(2024, Month.AUGUST, 1), LocalTime.of(14, 0, 0))
            );

            repository.saveAll(
                List.of(event0, event1)
            );
        };
    }
}
