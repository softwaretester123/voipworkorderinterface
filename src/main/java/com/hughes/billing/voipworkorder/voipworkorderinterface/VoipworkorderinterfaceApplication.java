package com.hughes.billing.voipworkorder.voipworkorderinterface;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class VoipworkorderinterfaceApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(VoipworkorderinterfaceApplication.class, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(VoipworkorderinterfaceApplication.class);
	}

}
