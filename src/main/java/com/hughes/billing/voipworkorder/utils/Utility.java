package com.hughes.billing.voipworkorder.utils;

import java.util.Date;

public class Utility {
    public static Long getTimeStamp() {
        return new Date().getTime()/1000;
    }
}
