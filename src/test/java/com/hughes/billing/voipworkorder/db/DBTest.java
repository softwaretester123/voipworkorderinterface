package com.hughes.billing.voipworkorder.db;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.sql.DataSource;
import java.sql.SQLException;

@SpringBootTest(classes = DBTestConfig.class)
@Slf4j
class DBTest {
    @Autowired
    DataSource dataSource;

    @Test
    void test1() throws SQLException {
        log.info("catalog:" + dataSource.getConnection().getCatalog());
    }
}
