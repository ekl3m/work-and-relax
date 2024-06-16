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
        List<Long> friendListIDs1 = Arrays.asList(2L, 3L, 4L, 5L, 6L);
        List<Long> friendListIDs2 = Arrays.asList(1L, 3L, 4L, 5L, 6L);
        List<Long> friendListIDs3 = Arrays.asList(1L, 2L, 4L, 5L, 6L);
        List<Long> friendListIDs4 = Arrays.asList(1L, 2L, 3L, 5L, 6L);
        List<Long> friendListIDs5 = Arrays.asList(1L, 2L, 3L, 4L, 6L);
        List<Long> friendListIDs6 = Arrays.asList(1L, 2L, 3L, 4L, 5L);

        return args -> {
            UserProfile MariuszWyrwidab = new UserProfile(
                "Mariusz",
                "Wyrwidab",
                "Admin",
                "admin",
                friendListIDs1,
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
                friendListIDs2,
                2L,
                false,
                false,
                true,
                100001,
                "https://gryiksiazki.pl/storage/media/91c79b27-e056-4886-b6e4-abcf2dcd17a0/thumbnail/6axCDZZUrhDVi3wq5CABwPywpSB0KF/8a7395b05faac16c0095d81b59c81305.webp"    
            );
            UserProfile ErykKlemencki = new UserProfile(
                "Eryk",
                "Klemencki",
                "eryk.klem03@gmail.com",
                "ErykKlemencki",
                friendListIDs3,
                3L,
                false,
                false,
                true,
                100002,
                "https://www.e-korepetycje.net/images/users/5219/521968/230_user-image.jpg?0609231707"
            );
            UserProfile JakubMagdziak = new UserProfile(
                "Jakub",
                "Magdziak",
                "jakubmagdziak10@gmail.com",
                "JakubMagdziak",
                friendListIDs4,
                4L,
                false,
                false,
                true,
                100003,
                "https://scontent.flcj1-1.fna.fbcdn.net/v/t39.30808-6/309718788_1933381423519068_311456244083480422_n.jpg?stp=cp6_dst-jpg&_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_ohc=9S99Qs-rfuUQ7kNvgEC3K2N&_nc_ht=scontent.flcj1-1.fna&oh=00_AYD7zAVDpQaio5d1z7ex9930Me9awX10tY7yOOfib8m1Ag&oe=6674A13D"
            );
            UserProfile IgorFornal = new UserProfile(
                "Igor",
                "Fornal",
                "igor.fornal@gmail.com",
                "IgorFornal",
                friendListIDs5,
                5L,
                false,
                false,
                true,
                100004,
                "https://scontent.flcj1-1.fna.fbcdn.net/v/t39.30808-6/301603436_2000438516832850_9060961485547582761_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_ohc=FjPjaxi2PawQ7kNvgFjVxgG&_nc_ht=scontent.flcj1-1.fna&oh=00_AYBm1RXE6X0o_B5uW_OF4efwe0UgYaGiE2B7ARuOUcZfxg&oe=6674B678"
            );
            UserProfile DanielSzymczak = new UserProfile(
                "Daniel",
                "Szymczak",
                "daniel.szymczak@gmail.com",
                "DanielSzymczak",
                friendListIDs6,
                6L,
                false,
                false,
                true,
                100005,
                "https://scontent.flcj1-1.fna.fbcdn.net/v/t39.30808-6/295928645_949582429774226_3736736833915525717_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_ohc=-n3LsCLZyJ4Q7kNvgEKaf5d&_nc_ht=scontent.flcj1-1.fna&oh=00_AYBKgWTvnnlQsTnMdWGJRDqDs7zpZk5Mgu0Ic9-hHP_E8A&oe=6674A68F"
            );
            
            repository.saveAll(
            List.of(MariuszWyrwidab, AdamMickiewicz, ErykKlemencki, JakubMagdziak, IgorFornal, DanielSzymczak));
        };
    }
}
