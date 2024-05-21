package com.workrelax.workrelaxapp.tools;

public class Exceptions {

    public static class InvalidApiKey extends Exception {
        public InvalidApiKey(String message) {
            super(message);
        }
    }

    public static class ApiKeyNotProvided extends Exception {
        public ApiKeyNotProvided(String message) {
            super(message);
        }
    }

    public static class UserProfileAlreadyExists extends Exception {
        public UserProfileAlreadyExists(String message) {
            super(message);
        }
    }

    public static class UserProfileNotFound extends Exception {
        public UserProfileNotFound(String message) {
            super(message);
        }
    }

    public static class PasswordTooShort extends Exception {
        public PasswordTooShort(String message) {
            super(message);
        }
    }

    public static class PlanNotFound extends Exception {
        public PlanNotFound(String message) {
            super(message);
        }
    }

    public static class PlanAlreadyExists extends Exception {
        public PlanAlreadyExists(String message) {
            super(message);
        }
    }
}
