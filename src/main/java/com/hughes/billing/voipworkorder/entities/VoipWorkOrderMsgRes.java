package com.hughes.billing.voipworkorder.entities;

import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;

@Data
@Entity
@Table(name = "HNS_BILLING_VOIP_WO_MSG_RES_T")
@NoArgsConstructor
@AllArgsConstructor
public class VoipWorkOrderMsgRes {
    @Id
    @Column(name = "REQ_ID")
    private Long reqId;

    @Column(name = "TRANSACTIONDATETIME")
    private Timestamp transactionDateTime;

    @Column(name = "CREATED_T")
    private Long createdTimeStamp;

    @Column(name = "MESSAGE_NAME")
    private String messageName;

    @Column(name = "MSG_DESTINATION")
    private String messageDestination;

    @Column(name = "REMARKS")
    private String remarks;

    @Column(name = "PUBLISHED_PAYLOAD")
    private String publishedPayload;

}
