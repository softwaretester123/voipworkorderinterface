package com.hughes.billing.voipworkorder.repositroy;

import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgReq;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface VoipWorkOrderMsgReqRepo extends JpaRepository<VoipWorkOrderMsgReq, Long> {
    @Procedure(procedureName = "CREATE_BRT_WO", outputParameterName = "RETVAL")
    String createBRTWO(@Param("ACCNO") String account_number,
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
    String cancelBRTAccount(@Param("ACCNO") String account_number);
}
