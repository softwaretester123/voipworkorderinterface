package com.hughes.billing.voipworkorder;

import com.ulisesbocchio.jasyptspringboot.annotation.EnableEncryptableProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableEncryptableProperties
public class VoipWorkOrderApplication {

	public static void main(String[] args) {
		SpringApplication.run(VoipWorkOrderApplication.class, args);
	}

}
