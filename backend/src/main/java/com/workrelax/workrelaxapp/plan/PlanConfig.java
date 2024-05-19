package com.workrelax.workrelaxapp.plan;

import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class PlanConfig {

    @Bean
    CommandLineRunner commandLineRunner(PlanRepository repository) {
        return args -> {
            Plan plan0 = new Plan(
                true,
                1L,
                null
            );
            Plan plan1 = new Plan(
                true,
                2L,
                null
            );

            repository.saveAll(
                List.of(plan0, plan1)
            );
        };
    }
}
