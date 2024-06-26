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
                "Oferuję na sprzedaż przestronne i nowoczesne mieszkanie, idealne dla studentów. Mieszkanie znajduje się w doskonałej lokalizacji, blisko uczelni oraz komunikacji miejskiej. Składa się z dwóch sypialni, salonu, kuchni oraz łazienki. Jest w pełni umeblowane i wyposażone w niezbędne sprzęty AGD.\n\nW pobliżu znajdują się liczne sklepy, restauracje oraz punkty usługowe, co czyni to miejsce niezwykle wygodnym do życia. Mieszkanie jest gotowe do zamieszkania od zaraz. Zainteresowanych proszę o kontakt w celu umówienia się na oględziny.",
                "https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Flat.jpg/2560px-Flat.jpg");

            Announcement announcement1 = new Announcement(
                "Erasmus",
                "Z przyjemnością informujemy, że łódzkie uczelnie będą gościć grupy studentów z Afryki w ramach programu Erasmus. To wyjątkowa okazja, aby poznać nowe kultury, nawiązać międzynarodowe przyjaźnie i wymienić się doświadczeniami akademickimi.\n\nStudenci będą uczestniczyć w różnorodnych zajęciach i warsztatach, a także będą mieli okazję zaprezentować swoje kraje podczas specjalnych wydarzeń kulturalnych. Zapraszamy wszystkich studentów do aktywnego udziału i wsparcia naszych gości. Dołącz do nas i odkryj bogactwo afrykańskiej kultury!",
                "https://klubpodroznikowbit.pl/wp-content/uploads/2020/11/photo_39663_20150728.jpg");

            Announcement announcement2 = new Announcement(
                "Praca dla studentów",
                "Szukasz pracy, która pozwoli Ci pogodzić naukę z zarabianiem? Oferujemy elastyczne godziny pracy w różnych branżach, od gastronomii po administrację biurową. Praca idealna dla studentów, którzy chcą zdobyć doświadczenie zawodowe i zarobić na swoje potrzeby.\n\nOferujemy atrakcyjne wynagrodzenie, możliwość rozwoju i awansu, a także pracę w młodym i dynamicznym zespole. Nie czekaj, aplikuj już teraz i zacznij swoją karierę zawodową z nami!",
                "https://internationalgroupjob.com/images/design/extracontent-b1.webp");

            Announcement announcement3 = new Announcement(
                "Kursy językowe PŁ",
                "Chcesz podnieść swoje umiejętności językowe? Zapraszamy na intensywne kursy językowe organizowane przez Politechnikę Łódzką. Oferujemy kursy na różnych poziomach zaawansowania, prowadzone przez doświadczonych lektorów.\n\nKursy obejmują języki takie jak angielski, niemiecki, hiszpański, francuski i wiele innych. Zajęcia odbywają się w małych grupach, co zapewnia indywidualne podejście i efektywne nauczanie. Zapisz się już dziś i poszerz swoje horyzonty językowe!",
                "https://www.bestcustomflags.com/wp-content/uploads/2016/09/INTL.jpg");

            Announcement announcement4 = new Announcement(
                "Stypendia naukowe UW",
                "Uniwersytet Warszawski ogłasza nabór na stypendia naukowe dla studentów wyróżniających się wysokimi wynikami w nauce oraz aktywnością naukową. Stypendia mają na celu wspieranie rozwoju akademickiego i nagradzanie wybitnych osiągnięć.\n\nKandydaci mogą ubiegać się o stypendia w różnych kategoriach, w tym za wyniki w nauce, badania naukowe oraz działalność społeczną. Szczegółowe informacje oraz formularze aplikacyjne dostępne są na stronie internetowej uczelni. Nie przegap tej szansy na wsparcie swojego rozwoju!",
                "https://api.buki.org.pl/news_image/gZ/yA/gZyAb5kXquILlcJzEBbSZrPWV9cwoc1bypEzQMM8.jpg");

            Announcement announcement5 = new Announcement(
                "Wolontariat",
                "Zapraszamy studentów do udziału w programie wolontariatu, który daje możliwość zdobycia cennego doświadczenia i przyczynienia się do społeczności. Wolontariat to nie tylko pomoc innym, ale także rozwijanie swoich umiejętności interpersonalnych i organizacyjnych.\n\nOferujemy różnorodne projekty wolontariackie, od pracy z dziećmi, przez pomoc w schroniskach dla zwierząt, po organizację wydarzeń kulturalnych. Dołącz do naszego zespołu wolontariuszy i zrób coś dobrego dla innych!",
                "https://wolontariat.wrk.org.pl/wp-content/uploads/2018/05/obrazzzzz.png");

            Announcement announcement6 = new Announcement(
                "Spotkanie integracyjne UMED",
                "Zapraszamy wszystkich studentów na spotkanie integracyjne, które odbędzie się na kampusie UMEDu na terenie CKD. To doskonała okazja, aby poznać swoich rówieśników, dowiedzieć się więcej o uczelni i jej działalności oraz spędzić miło czas w towarzystwie innych studentów.\n\nW programie przewidziane są gry i zabawy integracyjne, prezentacje organizacji studenckich, a także poczęstunek. Dołącz do nas i zacznij swoją przygodę studencką w przyjaznej atmosferze!",
                "https://www.otouczelnie.pl/assets/uploads/news_rekrutacja/64b7d36166113_IMG_4152.jpeg");

            Announcement announcement7 = new Announcement(
                "Wymiana międzynarodowa",
                "Marzysz o studiowaniu za granicą? Politechnika Łódzka oferuje programy wymiany międzynarodowej z partnerskimi uniwersytetami na całym świecie. To wyjątkowa szansa, aby zdobyć nowe doświadczenia, poznać inne kultury i nawiązać międzynarodowe kontakty.\n\nProgramy wymiany obejmują różne kierunki studiów i poziomy zaawansowania. Aplikuj już teraz i otwórz przed sobą drzwi do globalnej edukacji!",
                "https://www.eurostudent.pl/wp-content/uploads/2016/07/post-6237.gif");

            Announcement announcement8 = new Announcement(
                "Konsultacje z doradcą zawodowym",
                "Nie wiesz, jak pokierować swoją karierą? Skorzystaj z bezpłatnych konsultacji z doradcą zawodowym, który pomoże Ci zaplanować ścieżkę zawodową, napisać CV i przygotować się do rozmowy kwalifikacyjnej. Doradca pomoże Ci również w identyfikacji Twoich mocnych stron i potencjalnych ścieżek kariery.\n\nZapisy na konsultacje odbywają się online. Nie zwlekaj, zainwestuj w swoją przyszłość już dziś!",
                "https://www.casfera.pl/wp-content/uploads/2022/03/ca_1600px_doradca_zawodowy.jpg");

            Announcement announcement9 = new Announcement(
                "Rekrutacja do kół naukowych PŁ",
                "Jeśli interesujesz się nauką i chcesz rozwijać swoje zainteresowania, dołącz do jednego z wielu kół naukowych działających wsród studentów Politechniki Łódzkiej. Kółka naukowe oferują możliwość pracy nad projektami badawczymi, uczestnictwa w konferencjach i warsztatach oraz nawiązania kontaktów z ekspertami z różnych dziedzin.\n\nRekrutacja trwa przez cały semestr. Sprawdź ofertę kół naukowych i wybierz to, które najlepiej odpowiada Twoim zainteresowaniom. Rozwijaj swoje pasje i zdobywaj cenne doświadczenie naukowe!",
                "https://kola.samorzad.p.lodz.pl/_next/image?url=https%3A%2F%2Fres.cloudinary.com%2Fdikfq3kxl%2Fimage%2Fupload%2Fv1713206161%2FLogo_Polimer_duze_9729c28501.webp&w=640&q=75");

            repository.saveAll(List.of(announcement0, announcement1, announcement2, announcement3, announcement4, announcement5, announcement6, announcement7, announcement8, announcement9));
        };
    }
}
