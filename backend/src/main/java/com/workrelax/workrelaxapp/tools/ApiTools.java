package com.workrelax.workrelaxapp.tools;

public class ApiTools {
    // Valid API keys:
    private static final String[] API_KEY = {"yK9v2TA1GZkq3dTbdfR_1v1NCxE_H9oK4i5H0QKslHg"};

    // Tools:
    public boolean isKeyValid(String key) {
        if (key.isEmpty()) {
            return false;
        }
        if (!stringArrContains(API_KEY, key)) {
            return false;
        }
        return true;
    }

    // Support tools:
    private static boolean stringArrContains(String[] array, String value) {
        for (String str : array) {
            if (str.equals(value)) {
                return true;
            }
        }
        return false;
    }
}
