package com.hughes.billing.voipworkorder.utils;

import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import lombok.extern.slf4j.Slf4j;
import org.apache.avro.Schema;
import org.apache.avro.generic.GenericDatumReader;
import org.apache.avro.io.DatumReader;
import org.apache.avro.io.Decoder;
import org.apache.avro.io.DecoderFactory;
import org.apache.avro.specific.SpecificDatumReader;

import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.InputStream;

@Slf4j
public class SubscriberUtils {
    public static void deserializeRequest(String data) {
        log.info("deserializeRequest : STARTS : data = " + data);
        VoIPWorkOrder voIPWorkOrder = null;
        try {
            DatumReader<VoIPWorkOrder> reader = new SpecificDatumReader<>(VoIPWorkOrder.class);
            Decoder decoder = DecoderFactory.get().jsonDecoder(VoIPWorkOrder.getClassSchema(), data);
            voIPWorkOrder = reader.read(null, decoder);

            log.info("deserializeRequest : voIPWorkOrder = " + voIPWorkOrder);
        } catch (Exception e) {
            log.error("deserializeRequest : Exception: " + e.getMessage());
            e.printStackTrace();
        }
        log.info("deserializeRequest : ENDS");
    }
}
