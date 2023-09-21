package com.hughes.billing.voipworkorder.repositroy;

import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgReq;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VoipWorkOrderMsgReqRepo extends JpaRepository<VoipWorkOrderMsgReq, Long> {
    VoipWorkOrderMsgReq findByTransactionSequenceId(String transactionSequenceId);
}
