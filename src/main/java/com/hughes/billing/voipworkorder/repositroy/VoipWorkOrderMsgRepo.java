package com.hughes.billing.voipworkorder.repositroy;

import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

public interface VoipWorkOrderMsgRepo extends JpaRepository<VoipWorkOrderMsgDTO, Long> {
    @Procedure(procedureName = "CREATE_BRT_WO", outputParameterName = "RETVAL")
    String createVoipWO(@Param("ACCNO") String account_number,
                        @Param("WO_TYPE") String wo_type,
                        @Param("FNAME") String f_name,
                        @Param("LNAME") String l_name,
                        @Param("ADDR1") String addr1,
                        @Param("CITY") String city,
                        @Param("STATE") String state,
                        @Param("ZIP") String zip,
                        @Param("PHONE") String phone,
                        @Param("BILLING_DEAL") String billing_deal,
                        @Param("GL_SEG") String gl_seg);

    @Procedure(procedureName = "CANCEL_BRT_ACCOUNT", outputParameterName = "RETVAL")
    String cancelVoipWo(@Param("ACCNO") String account_number);

    @Query(value = "SELECT DATE_TO_INFRANET(PIN_VIRTUAL_TIME) AS TIMESTAMP FROM DUAL", nativeQuery = true)
    Long getServerTime();
}
