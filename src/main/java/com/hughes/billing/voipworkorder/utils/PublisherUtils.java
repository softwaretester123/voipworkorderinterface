package com.hughes.billing.voipworkorder.utils;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import lombok.extern.slf4j.Slf4j;
import org.apache.avro.io.*;
import org.apache.avro.specific.SpecificDatumReader;
import org.apache.avro.specific.SpecificDatumWriter;

import java.io.ByteArrayOutputStream;

@Slf4j
public class PublisherUtils {
    public static byte[] serializeResponse(String response) {
        log.info("PublisherUtils :: serializeResponse : STARTS");
        DatumReader<VoIPWorkOrderAckMsg> reader = new SpecificDatumReader<>(VoIPWorkOrderAckMsg.class);
        DatumWriter<VoIPWorkOrderAckMsg> writer = new SpecificDatumWriter<>(VoIPWorkOrderAckMsg.class);
        byte[] data = new byte[0];

        try (ByteArrayOutputStream stream = new ByteArrayOutputStream()) {
            Decoder decoder = DecoderFactory.get().jsonDecoder(VoIPWorkOrderAckMsg.getClassSchema(), response);
            Encoder encoder = EncoderFactory.get().jsonEncoder(VoIPWorkOrderAckMsg.getClassSchema(), stream);
            VoIPWorkOrderAckMsg voIPWorkOrderAckMsg = reader.read(null, decoder);
            writer.write(voIPWorkOrderAckMsg, encoder);
            encoder.flush();
            data = stream.toByteArray();
        } catch (Exception e) {
            log.error("PublisherUtils :: serializeResponse : Exception occurred while serializing the response: " + e.getMessage());
        }
        log.info("PublisherUtils :: serializeResponse : ENDS");
        return data;
    }
}
