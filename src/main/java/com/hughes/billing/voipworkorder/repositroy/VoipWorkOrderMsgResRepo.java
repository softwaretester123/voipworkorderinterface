package com.hughes.billing.voipworkorder.repositroy;

import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgRes;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VoipWorkOrderMsgResRepo extends JpaRepository<VoipWorkOrderMsgRes, Long> {
    VoipWorkOrderMsgRes findByReqId(Long reqId);
}
