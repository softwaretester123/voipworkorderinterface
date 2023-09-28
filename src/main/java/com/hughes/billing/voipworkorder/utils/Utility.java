package com.hughes.billing.voipworkorder.utils;

import lombok.extern.slf4j.Slf4j;

import java.util.Date;

@Slf4j
public class Utility {

    public static Long getTimeStamp() {
        return new Date().getTime()/1000;
    }


}
