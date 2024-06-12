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

    public static class EventAlreadyExists extends Exception {
        public EventAlreadyExists(String message) {
            super(message);
        }
    }

    public static class EventNotFound extends Exception {
        public EventNotFound(String message) {
            super(message);
        }
    }

    public static class DateInThePast extends Exception {
        public DateInThePast(String message) {
            super(message);
        }
    }

    public static class ChatAlreadyExists extends Exception {
        public ChatAlreadyExists(String message) {
            super(message);
        }
    }

    public static class ChatNotFound extends Exception {
        public ChatNotFound(String message) {
            super(message);
        }
    }

    public static class AnnouncementAlreadyExists extends Exception {
        public AnnouncementAlreadyExists(String message) {
            super(message);
        }
    }

    public static class AnnouncementNotFound extends Exception {
        public AnnouncementNotFound(String message) {
            super(message);
        }
    }

    public static class ActivityAlreadyExists extends Exception {
        public ActivityAlreadyExists(String message) {
            super(message);
        }
    }

    public static class ActivityNotFound extends Exception {
        public ActivityNotFound(String message) {
            super(message);
        }
    }

    public static class LocationAlreadyExists extends Exception {
        public LocationAlreadyExists(String message) {
            super(message);
        }
    }

    public static class LocationNotFound extends Exception {
        public LocationNotFound(String message) {
            super(message);
        }
    }
}
