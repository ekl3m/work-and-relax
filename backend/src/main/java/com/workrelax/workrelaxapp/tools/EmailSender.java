package com.workrelax.workrelaxapp.tools;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender {

    public Integer sendVerificationMail(String Recipent) {
        Integer verificationCode = generateVerificationCode();

        // Konfiguracja właściwości SMTP
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com"); // Dla Gmaila
        props.put("mail.smtp.port", "587");

        // Sesja z uwierzytelnianiem
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("noreply.work.and.relax@gmail.com", "ippjjprpcjyegytt");
            }
        });

        try {
            // Tworzenie wiadomości
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("noreply.work.and.relax@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(Recipent));
            message.setSubject("WORK & RELAX: Potwierdź swój adres email");
            message.setContent(
            """
            <html>
                <body>
                    <p>Drogi Użytkowniku,</p>
                    <p>Dziękujemy za rejestrację w naszej aplikacji! Jesteśmy podekscytowani, że dołączasz do naszej społeczności. Aby zapewnić Ci pełny dostęp do wszystkich funkcji, prosimy o zweryfikowanie Twojego adresu e-mail.</p>
                    <p>Weryfikacja Twojego e-maila jest szybka i prosta. Wystarczy, że użyjesz poniższego kodu weryfikacyjnego:</p>
                    <h2 style="color: blue;">Twój kod weryfikacyjny:</h2><h2 style="color: red;">""" + verificationCode + """
                    </h2>
                    <h3>Jak zweryfikować swój adres e-mail?</h3>
                    <ol>
                        <li>Otwórz naszą aplikację i zaloguj się na swoje konto.</li>
                        <li>Przejdź do sekcji "Weryfikacja e-maila".</li>
                        <li>Wprowadź powyższy kod weryfikacyjny i kliknij "Zweryfikuj".</li>
                    </ol>
                    <p>Po weryfikacji będziesz mógł korzystać z następujących funkcji:</p>
                    <ul>
                        <li>Pełny dostęp do wszystkich opcji aplikacji.</li>
                        <li>Otrzymywanie ważnych aktualizacji i powiadomień.</li>
                        <li>Zwiększone bezpieczeństwo Twojego konta.</li>
                    </ul>
                    <p>Jeśli masz jakiekolwiek pytania lub napotkasz problemy, nasz zespół wsparcia jest gotowy, aby Ci pomóc. Możesz się z nami skontaktować, wysyłając wiadomość na: <a href="mailto:support@workandrelax.pl">support@workandrelax.pl</a></p>
                    <p>Dziękujemy, że jesteś z nami!</p>
                    <p>Z poważaniem,<br>Zespół Work & Relax</p>
                </body>
            </html>
            """, "text/html; charset=UTF-8");

            // Wysyłanie wiadomości
            Transport.send(message);

            System.out.println("Wiadomość została wysłana.");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

        return verificationCode;
    }

    private Integer generateVerificationCode() {
        Random random = new Random();
        int verificationCode = 100000 + random.nextInt(900000); // Zakres od 100000 do 999999
        return verificationCode;
    }
}
