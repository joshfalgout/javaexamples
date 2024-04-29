package com.example;

import org.apache.commons.lang3.StringUtils;

public class App {
    public static void main(String[] args) {
        String message = "Hello, World!";
        String reversedMessage = StringUtils.reverse(message);
        System.out.println(reversedMessage);
    }
}

