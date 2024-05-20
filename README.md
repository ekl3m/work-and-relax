# Work & Relax

iOS application based on a Spring backend with a JPA-managed PostgresSQL database made for college students to manage their free time. This is not an official application, it is a college project for class.

## Installation

To install and set up this project, follow these steps:

### Backend

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/work-and-relax.git
    ```

2. Navigate to the backend directory:
    ```sh
    cd work-and-relax/backend
    ```

3. Set up the PostgresSQL database:
    - Ensure you have PostgresSQL installed and running.
    - Create a database for the project.
    - Update the `application.properties` file with your database configuration.

4. Build and run the backend:
    ```sh
    ./mvnw spring-boot:run
    ```

### iOS Application

1. Navigate to the iOS application directory:
    ```sh
    cd ../frontend/WorkAndRelax
    ```

2. Open the Xcode project:
    ```sh
    open WorkAndRelax.xcodeproj
    ```

3. Configure the backend URL in the application settings.

4. Build and run the application on a simulator or a device.

## Usage

Once the backend and the iOS application are set up and running, you can use the application to manage your free time effectively. The app allows you to:

- Browse events and announcements
- Add and manage activities
- Chat with others
- Monitor your curriculum

## Examples

Here are some example usages of the app:

1. **Adding an Activity:**
    - Open the app and navigate to the Calendar screen.
    - Press "+" button.
    - Enter the activity details and save it.

2. **Browsing Homepage:**
    - Go to the Homepage section.
    - Scroll up and down to browse events and announcements.

## Contribution

Please adhere to the following commit pattern:

- Commit pattern: `"VX.X.X : Change description"` where `X` is a natural number.
  
    ```sh
    git commit -m "V1.0.0 : Initial commit"
    ```

To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Make your changes.
4. Commit your changes (`git commit -m "VX.X.X : Change description"`).
5. Push to the branch (`git push origin feature/your-feature`).
6. Open a pull request.

## License

This project is licensed to ekl3m and JakubMagdziak. Contact them about the license from contact details provided below.

## Contact

For any inquiries or issues, please contact us at:

ekl3m:
- Email: sq.programs@gmail.com
- GitHub: [ekl3m](https://github.com/ekl3m)

JakubMagdziak:
- Email: jakubmagdziak10@gmail.com
- GitHub: [JakubMagdziak](https://github.com/JakubMagdziak)

