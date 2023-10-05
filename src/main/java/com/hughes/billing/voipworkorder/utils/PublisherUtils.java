package com.hughes.billing.voipworkorder.utils;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import lombok.extern.slf4j.Slf4j;
import org.apache.avro.generic.GenericDatumReader;
import org.apache.avro.generic.GenericDatumWriter;
import org.apache.avro.io.*;
import org.apache.avro.specific.SpecificDatumReader;
import org.apache.avro.specific.SpecificDatumWriter;

import java.io.ByteArrayOutputStream;

@Slf4j
public class PublisherUtils {

    /**
     * Serializes the given VoIPWorkOrderAckMsg response into a byte array.
     *
     * @param  response  the VoIPWorkOrderAckMsg response to be serialized
     * @return           the serialized byte array of the response, or an empty byte array if an exception occurs
     */
    public static byte[] serializeResponse(VoIPWorkOrderAckMsg response) {
        log.info("serializeResponse : STARTS: serializeResponse : response = " + response);
        DatumWriter<VoIPWorkOrderAckMsg> writer = new SpecificDatumWriter<>(VoIPWorkOrderAckMsg.getClassSchema());
        byte[] data;
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        try {
            Encoder encoder = EncoderFactory.get().binaryEncoder(stream, null);
            writer.write(response, encoder);
            encoder.flush();
            data = stream.toByteArray();
            stream.close();
        } catch (Exception e) {
            log.error("serializeResponse : Exception occurred while serializing the response: " + e.getMessage());
            data = new byte[0];
        }
        log.info("serializeResponse : ENDS");
        return data;
    }
}
