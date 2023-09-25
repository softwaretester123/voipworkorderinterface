package com.hughes.billing.voipworkorder.entities;

import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "HNS_BILLING_VOIP_WO_MSG_REQ_T")
@NamedStoredProcedureQuery(name = "PIN.CREATE_BRT_WO", procedureName = "PIN.CREATE_BRT_WO")
public class VoipWorkOrderMsgReq {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "voip_wo_msg_req_seq")
    @SequenceGenerator(name = "voip_wo_msg_req_seq", sequenceName = "HNS_BILLING_VOIP_WO_MSG_REQ_T_SEQ", allocationSize = 1)
    private Long id;

    @Column(name = "TRANSACTION_SEQUENCE_ID")
    private String transactionSequenceId;

    @Column(name = "TRANSACTIONDATETIME")
    private Timestamp transactionDateTime;

    @Column(name = "CREATED_T")
    private Long createdTimeStamp;

    @Column(name = "MESSAGE_NAME")
    private String messageName;

    @Column(name = "MSG_SOURCE")
    private String messageSource;

    @Column(name = "SAN")
    private String san;

    @Column(name = "WORKORDERTYPE")
    private String workOrderType;

    @Column(name = "REMARKS")
    private String remarks;

    @Column(name = "CONSUMED_PAYLOAD")
    private String consumedPayload;
}
