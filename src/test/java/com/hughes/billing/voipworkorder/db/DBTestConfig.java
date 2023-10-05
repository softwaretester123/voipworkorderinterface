package com.hughes.billing.voipworkorder.db;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
public class DBTestConfig {
    @Bean
    DataSource dataSource() {
        HikariConfig config = new HikariConfig();
        config.setMaximumPoolSize(5);
        config.setDriverClassName("oracle.jdbc.OracleDriver");
        config.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:ORCLCDB");
        config.setUsername("pin");
        config.setPassword("Sdg12345");
        return new HikariDataSource(config);
    }
}
