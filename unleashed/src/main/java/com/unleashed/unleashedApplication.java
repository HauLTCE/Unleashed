package com.unleashed;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication()
@EnableAsync
@Configuration
public class unleashedApplication {

    public static void main(String[] args) {
        SpringApplication.run(unleashedApplication.class, args);

    }
}
