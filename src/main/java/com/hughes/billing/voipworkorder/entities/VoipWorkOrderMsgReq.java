package com.hughes.billing.voipworkorder.entities;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@Entity
@Table(name = "HNS_BILLING_VOIP_WO_MSG_REQ_T")
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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTransactionSequenceId() {
        return transactionSequenceId;
    }

    public void setTransactionSequenceId(String transactionSequenceId) {
        this.transactionSequenceId = transactionSequenceId;
    }

    public Timestamp getTransactionDateTime() {
        return transactionDateTime;
    }

    public void setTransactionDateTime(Timestamp transactionDateTime) {
        this.transactionDateTime = transactionDateTime;
    }

    public Long getCreatedTimeStamp() {
        return createdTimeStamp;
    }

    public void setCreatedTimeStamp(Long createdTimeStamp) {
        this.createdTimeStamp = createdTimeStamp;
    }

    public String getMessageName() {
        return messageName;
    }

    public void setMessageName(String messageName) {
        this.messageName = messageName;
    }

    public String getMessageSource() {
        return messageSource;
    }

    public void setMessageSource(String messageSource) {
        this.messageSource = messageSource;
    }

    public String getSan() {
        return san;
    }

    public void setSan(String san) {
        this.san = san;
    }

    public String getWorkOrderType() {
        return workOrderType;
    }

    public void setWorkOrderType(String workOrderType) {
        this.workOrderType = workOrderType;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getConsumedPayload() {
        return consumedPayload;
    }

    public void setConsumedPayload(String consumedPayload) {
        this.consumedPayload = consumedPayload;
    }
}
