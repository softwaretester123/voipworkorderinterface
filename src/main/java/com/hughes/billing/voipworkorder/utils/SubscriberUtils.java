package com.hughes.billing.voipworkorder.utils;

import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import lombok.extern.slf4j.Slf4j;
import org.apache.avro.io.DatumReader;
import org.apache.avro.io.Decoder;
import org.apache.avro.io.DecoderFactory;
import org.apache.avro.specific.SpecificDatumReader;

@Slf4j
public class SubscriberUtils {
    /**
     * Deserialize the given data into a VoIPWorkOrder object.
     *
     * @param  data  the data to be deserialized
     * @return       the deserialized VoIPWorkOrder object, or null if deserialization fails
     */
    public static VoIPWorkOrder deserializeRequest(String data) {
        log.info("deserializeRequest : STARTS : data = " + data);
        VoIPWorkOrder voIPWorkOrder = null;
        try {
            DatumReader<VoIPWorkOrder> reader = new SpecificDatumReader<>(VoIPWorkOrder.class);
            Decoder decoder = DecoderFactory.get().jsonDecoder(VoIPWorkOrder.getClassSchema(), data);
            voIPWorkOrder = reader.read(null, decoder);

            log.info("deserializeRequest : voIPWorkOrder = " + voIPWorkOrder);
        } catch (Exception e) {
            log.error("deserializeRequest : Exception: " + e.getMessage());
        }
        log.info("deserializeRequest : ENDS");
        return voIPWorkOrder;
    }
}
