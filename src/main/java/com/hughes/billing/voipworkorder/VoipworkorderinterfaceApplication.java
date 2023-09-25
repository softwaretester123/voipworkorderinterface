package com.hughes.billing.voipworkorder;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class VoipworkorderinterfaceApplication {

	public static void main(String[] args) {
		SpringApplication.run(VoipworkorderinterfaceApplication.class, args);
	}

}
