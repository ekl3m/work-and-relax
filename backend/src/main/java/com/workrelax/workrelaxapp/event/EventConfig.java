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
                    "Festiwal piwa to wyjątkowe wydarzenie, które łączy miłośników złocistego trunku z różnych zakątków świata. Odwiedzający mają okazję spróbować różnych gatunków piwa, od lokalnych browarów po międzynarodowe marki. Wydarzenie obfituje w konkursy na najlepsze piwo, warsztaty warzenia oraz koncerty na żywo.\n\nCzekają na Ciebie stoiska z różnorodnym jedzeniem, które idealnie komponuje się z serwowanym piwem. To doskonała okazja, aby spędzić czas z przyjaciółmi, cieszyć się muzyką i delektować się wyjątkowymi smakami. Nie przegap okazji, aby stać się częścią tego niezapomnianego święta piwa!",
                    "https://i.imgur.com/t5B2kTQ.png",
                    LocalDateTime.of(LocalDate.of(2024, Month.JULY, 15), LocalTime.of(15, 0, 0)));

            Event event1 = new Event(
                    "Comicon",
                    "Comicon to mekka dla fanów komiksów, filmów, seriali i gier. Przyjdź przebrany za swoją ulubioną postać i weź udział w jednym z największych konkursów cosplay. Na wydarzeniu spotkasz znanych twórców komiksów, aktorów oraz innych pasjonatów popkultury.\n\nPanele dyskusyjne, warsztaty rysunkowe i liczne stoiska z gadżetami sprawią, że każdy znajdzie coś dla siebie. To miejsce, gdzie wyobraźnia nie ma granic, a każdy fan może poczuć się jak w świecie swoich ulubionych bohaterów. Dołącz do tysięcy innych uczestników i przeżyj niesamowitą przygodę na Comicon!",
                    "https://i.imgur.com/XGInjbt.jpeg",
                    LocalDateTime.of(LocalDate.of(2024, Month.AUGUST, 1), LocalTime.of(14, 0, 0)));

            Event event2 = new Event(
                    "Koncert rockowy",
                    "Koncert rockowy to prawdziwe święto dla miłośników mocnych brzmień. Na scenie wystąpią najlepsze zespoły rockowe, które zapewnią niezapomniane wrażenia muzyczne. Przygotuj się na wyjątkowe solo gitarowe, potężne riffy i energetyczne występy na żywo.\n\nTo wydarzenie to nie tylko muzyka, ale także spotkanie ludzi, którzy dzielą tę samą pasję. Atmosfera pełna entuzjazmu i radości sprawi, że każdy moment spędzony na koncercie będzie wyjątkowy. Niech moc rocka będzie z Tobą - dołącz do nas na tym niesamowitym wydarzeniu!",
                    "https://i.imgur.com/j5ZzQ3N.jpeg",
                    LocalDateTime.of(LocalDate.of(2024, Month.JULY, 20), LocalTime.of(18, 0, 0)));

            Event event3 = new Event(
                    "Pokaz sztucznych ogni",
                    "Pokaz sztucznych ogni to spektakularne widowisko, które rozświetli niebo setkami kolorowych eksplozji. To wydarzenie przyciąga tysiące widzów, którzy chcą podziwiać piękno i precyzję przygotowanych pokazów. Każdy wybuch jest dokładnie zsynchronizowany z muzyką, co tworzy niezapomniane wrażenia wizualno-dźwiękowe.\n\nOdwiedzający mogą również skorzystać z licznych stoisk z przekąskami i napojami, co czyni ten wieczór jeszcze bardziej wyjątkowym. Idealna okazja na romantyczny wieczór lub rodzinny wypad. Przyjdź i doświadcz magii nocy pełnej blasku i kolorów!",
                    "https://i.imgur.com/vZz1XX4.jpeg",
                    LocalDateTime.of(LocalDate.of(2024, Month.JULY, 25), LocalTime.of(21, 0, 0)));

            Event event4 = new Event(
                    "Maraton filmowy",
                    "Maraton filmowy to prawdziwa gratka dla kinomaniaków. Przez całą noc będą wyświetlane klasyczne filmy, które na stałe wpisały się do historii kinematografii. To idealna okazja, aby obejrzeć swoje ulubione filmy na dużym ekranie w gronie innych fanów.\n\nW przerwach między seansami będzie można wziąć udział w quizach filmowych i konkursach z nagrodami. Na miejscu dostępne będą także stoiska z popcornem, napojami i innymi przekąskami. Nie przegap tej wyjątkowej okazji na noc pełną filmowych emocji!",
                    "https://i.imgur.com/eXQ4g3v.jpeg",
                    LocalDateTime.of(LocalDate.of(2024, Month.AUGUST, 5), LocalTime.of(20, 0, 0)));

            Event event5 = new Event(
                    "Festiwal food trucków",
                    "Festiwal food trucków to raj dla smakoszy i miłośników kulinarnych przygód. Na miejscu znajdziesz różnorodne food trucki, oferujące dania z różnych zakątków świata. Od kuchni azjatyckiej, przez meksykańską, po klasyczne burgery i frytki.\n\nOdwiedzający będą mieli okazję spróbować nowych smaków, porozmawiać z kucharzami i odkryć tajniki ich kulinarnych umiejętności. To także świetna okazja, aby spędzić czas na świeżym powietrzu w towarzystwie rodziny i przyjaciół. Dołącz do nas i rozkoszuj się kulinarnymi przysmakami na Festiwalu food trucków!",
                    "https://i.imgur.com/WKk9J6g.jpeg",
                    LocalDateTime.of(LocalDate.of(2024, Month.AUGUST, 10), LocalTime.of(12, 0, 0)));

            Event event6 = new Event(
                    "Warsztaty jogi",
                    "Warsztaty jogi to doskonała okazja, aby zrelaksować się i znaleźć wewnętrzną równowagę. Pod okiem doświadczonych instruktorów będziesz mógł/mogła nauczyć się różnych technik jogi, od podstawowych po bardziej zaawansowane.\n\nWarsztaty obejmują zarówno ćwiczenia fizyczne, jak i techniki oddechowe oraz medytacyjne. To idealny sposób na redukcję stresu i poprawę ogólnego samopoczucia. Niezależnie od poziomu zaawansowania, każdy znajdzie coś dla siebie. Przyjdź i doświadcz harmonii ciała i umysłu na warsztatach jogi!",
                    "https://i.imgur.com/UJ2l93t.jpeg",
                    LocalDateTime.of(LocalDate.of(2024, Month.AUGUST, 15), LocalTime.of(10, 0, 0)));

            Event event7 = new Event(
                    "Jarmark bożonarodzeniowy",
                    "Jarmark bożonarodzeniowy to magiczne miejsce, które wprowadzi Cię w świąteczny nastrój. Na licznych straganach znajdziesz unikalne prezenty, rękodzieło oraz tradycyjne świąteczne przysmaki. Atmosfera pełna świątecznych światełek, kolęd i zapachu pierników sprawi, że poczujesz magię świąt.\n\nTo doskonała okazja, aby kupić prezenty dla najbliższych i spróbować świątecznych smakołyków. Dla dzieci przygotowano specjalne atrakcje, takie jak spotkanie ze Świętym Mikołajem. Dołącz do nas i poczuj świąteczną magię na jarmarku bożonarodzeniowym!",
                    "https://i.imgur.com/IMfRtK8.jpeg",
                    LocalDateTime.of(LocalDate.of(2024, Month.DECEMBER, 10), LocalTime.of(16, 0, 0)));

            Event event8 = new Event(
                    "Festiwal światła",
                    "Festiwal światła to wydarzenie, które rozświetli miasto setkami magicznych instalacji świetlnych. Podziwiaj niesamowite projekcje, interaktywne instalacje i artystyczne oświetlenie, które zamieni miejskie przestrzenie w magiczne miejsca.\n\nWydarzenie przyciąga artystów z całego świata, którzy prezentują swoje najnowsze prace. To idealna okazja, aby spędzić wieczór w niecodziennej atmosferze, pełnej kolorów i świateł. Zabierz rodzinę i przyjaciół, aby wspólnie podziwiać te niezwykłe widowiska. Dołącz do nas na Festiwalu światła i odkryj piękno nocnego miasta!",
                    "https://i.imgur.com/Y6fG6hK.jpeg",
                    LocalDateTime.of(LocalDate.of(2024, Month.SEPTEMBER, 1), LocalTime.of(19, 0, 0)));

            Event event9 = new Event(
                    "Targi książki",
                    "Targi książki to raj dla miłośników literatury. Poznaj autorów swoich ulubionych książek, weź udział w spotkaniach autorskich i odkryj nowości wydawnicze. Na miejscu znajdziesz stoiska z książkami różnych gatunków, od beletrystyki, przez literaturę faktu, po książki dla dzieci.\n\nTo także doskonała okazja, aby wziąć udział w warsztatach pisarskich i dyskusjach literackich. Atmosfera pełna pasji do książek sprawi, że poczujesz się jak w literackim raju. Dołącz do nas na targach książki i zanurz się w świat literatury!",
                    "https://i.imgur.com/BV3H7zY.jpeg",
                    LocalDateTime.of(LocalDate.of(2024, Month.OCTOBER, 15), LocalTime.of(11, 0, 0)));

            repository.saveAll(
                    List.of(event0, event1, event2, event3, event4, event5, event6, event7, event8, event9));
        };
    }
}
