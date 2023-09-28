package com.hughes.billing.voipworkorder.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "HNS_BILLING_VOIP_WO_MSG_DUMP_T")
public class VoipWorkOrderMsgDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "voip_wo_msg_dump_seq")
    @SequenceGenerator(name = "voip_wo_msg_dump_seq", sequenceName = "HNS_BILLING_VOIP_WO_MSG_DUMP_T_SEQ", allocationSize = 1)
    private Long id;

    @Column(name = "TRANSACTION_SEQUENCE_ID")
    private String transactionSequenceId;

    @Column(name = "TRANSACTIONDATETIME")
    private Timestamp transactionDateTime;

    @Column(name = "CREATED_T")
    private Long createdTimeStamp;

    @Column(name = "MODIFIED_T")
    private Long modifiedTimeStamp;

    @Column(name = "MESSAGE_NAME")
    private String messageName;

    @Column(name = "MSG_SOURCE")
    private String messageSource;

    @Column(name = "MSG_DESTINATION")
    private String messageDestination;

    @Column(name = "SAN")
    private String san;

    @Column(name = "WORKORDERTYPE")
    private String workOrderType;

    @Column(name = "STATUS")
    private String status;

    @Column(name = "STATE")
    private Integer state;

    @Column(name = "REMARKS")
    private String remarks;

    @Column(name = "CONSUMED_PAYLOAD")
    private String consumedPayload;

    @Column(name = "PUBLISHED_PAYLOAD")
    private String publishedPayload;

}
