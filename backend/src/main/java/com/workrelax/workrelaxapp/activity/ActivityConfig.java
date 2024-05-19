package com.workrelax.workrelaxapp.activity;

import java.time.LocalDateTime;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Month;
import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ActivityConfig {

    @Bean
    CommandLineRunner activityCommandLineRunner(ActivityRepository repository) {
        return args -> {
            Activity activity0 = new Activity(
                "Analiza matematyczna",
                "M. Kot, E103, A28",
                "",
                LocalDateTime.of(LocalDate.of(2024, Month.MAY, 30), LocalTime.of(10, 0, 0))
            );
            Activity activity1 = new Activity(
                "Fryzjer",
                "",
                "",
                LocalDateTime.of(LocalDate.of(2024, Month.MAY, 30), LocalTime.of(15, 30, 0))
            );

            repository.saveAll(
                List.of(activity0, activity1)
            );
        };
    }
}
