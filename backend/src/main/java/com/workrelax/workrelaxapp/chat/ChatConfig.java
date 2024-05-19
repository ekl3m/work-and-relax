package com.workrelax.workrelaxapp.chat;

import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ChatConfig {

    @Bean
    CommandLineRunner commandLineRunner(ChatRepository repository) {
        return args -> {
            Chat chat0 = new Chat(
                1L,
                2L,
                null
            );

            repository.saveAll(
                List.of(chat0)
            );
        };
    }
}
