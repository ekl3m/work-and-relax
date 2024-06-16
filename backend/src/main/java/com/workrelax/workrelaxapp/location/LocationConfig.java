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
            Location location3 = new Location(
                "Galeria Łódzka",
                "https://lh5.googleusercontent.com/p/AF1QipOS7wMG6gBttc7Dzdo0RY49YdVIUbGV_6HXgAs=w408-h306-k-no",
                51.75,
                19.4667,
                false
            );
            Location location4 = new Location(
                "Manufaktura",
                "https://lh5.googleusercontent.com/p/AF1QipMmM613eRF_irsNmJ5HmnwxbDsWYjyWUvzymG4U=w408-h273-k-no",
                51.779112,
                19.4464436,
                false
            );
            Location location5 = new Location(
                "Restauracja McDonald's",
                "https://lh5.googleusercontent.com/p/AF1QipOTBhkQV1fVTnMtYZTyTP5zObQNrQ5bx8o1Op0b=w408-h272-k-no",
                51.7575204,
                19.450244,
                true
            );
            Location location6 = new Location(
                "OFF Piotrkowska",
                "https://lh5.googleusercontent.com/p/AF1QipPm__LwGszS0fM5V_gDdYUAeUTrsOI4gVWFZBu0=w408-h542-k-no",
                51.7611732,
                19.4594569,
                false
            );
            Location location7 = new Location(
                "Serenissima Polska",
                "https://lh5.googleusercontent.com/p/AF1QipOm4zuGiAfy8RkCzdenm8eGuxdqC7yb2lwX-fYB=w521-h240-k-no",
                51.7488808,
                19.449465,
                true);
            Location location8 = new Location(
                "Park im. ks. J. Poniatowskiego",
                "https://lh5.googleusercontent.com/p/AF1QipMUl_yYd3arr1ar5BkCuZQKITGEoBT2o5HqNzYs=w408-h271-k-no",
                51.753982,
                19.441365,
                false
            );
            Location location9 = new Location(
                "Zatoka Sportu Politechniki Łódzkiej",
                "https://lh5.googleusercontent.com/p/AF1QipMftbrVNXEIlKj-VXLETqoElURQyePyZGXKxeVL=w408-h306-k-no",
                51.7467345,
                19.4519108,
                false
            );
            Location location10 = new Location(
                "Atlas Arena",
                "https://lh5.googleusercontent.com/p/AF1QipOVyPYGYTzuDsRhFHa9tpRjv7FpmrwSr-bfddD6=w408-h272-k-no",
                51.7571679,
                19.4250895,
                false
            );
            Location location11 = new Location(
                "KFC Łódź Pasaż Łódzki",
                "https://lh5.googleusercontent.com/p/AF1QipPddSWdU8kBV_avUKwFJ2AbqfjdvbD_WPJarKR9=w484-h240-k-no",
                51.7508413,
                19.4373423,
                true
            );
            Location location12 = new Location(
                "Kapusta z grochem",
                "https://lh5.googleusercontent.com/p/AF1QipNXh8eXoVdoNFUqP6Hy9ZQCLCoRIw7rg-FqbWLG=w408-h306-k-no",
                51.7458316,
                19.4571884,
                true
            );
            Location location13 = new Location(
                "Bar Ha Long",
                "https://lh5.googleusercontent.com/p/AF1QipOxevB0T2__FGP6GIp00_-xbOBN2fWJ5kreNiYp=w408-h306-k-no",
                51.7519836,
                19.4518992,
                true
            );

            repository.saveAll(List.of(location0, location1, location2, location3, location4, location5, location6, location7, location8, location9, location10, location11, location12, location13));
        };
    }
}
