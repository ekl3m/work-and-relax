package com.workrelax.workrelaxapp.location;

import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class LocationConfig {

    @Bean
    CommandLineRunner locationCommandLineRunner(LocationRepository repository) {
        return args -> {
            Location location0 = new Location(
                "Indeks - Kawiarnia & Bar",
                "https://indeksklub.pl/gallery/gallery10.JPG",
                51.7519824,
                19.4521595,
                true
            );
            Location location1 = new Location(
                "Kino Helios",
                "https://taniowmiescie.pl/wp-content/uploads/2023/05/twm_kino_helios_Bydgoszcz_4567-30-6493467.webp",
                51.7489978,
                19.4483357,
                false
            );
            Location location2 = new Location(
                "Zahir Kebab",
                "https://www.kalisz.pl/storage/image/core_files/2018/7/4/4898f0fee5c933b3187dff44ccdc2b5e/umkalisz/list/zahir.jpg",
                51.7519836,
                19.4518992,
                true
            );

            repository.saveAll(
                List.of(location0, location1, location2)
            );
        };
    }
}
