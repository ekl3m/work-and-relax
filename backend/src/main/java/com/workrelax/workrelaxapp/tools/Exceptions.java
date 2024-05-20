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
}
