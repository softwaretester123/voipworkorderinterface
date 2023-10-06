package com.hughes.billing.voipworkorder.utils;

import com.hughes.sdg.avro.CommonMessage;
import lombok.extern.slf4j.Slf4j;
import org.apache.avro.io.*;
import org.apache.avro.specific.SpecificDatumReader;
import org.apache.avro.specific.SpecificDatumWriter;

import java.io.ByteArrayOutputStream;

@Slf4j
public class PubSubUtils {

    /**
     * Serializes a CommonMessage object into a byte array.
     *
     * @param  request   the CommonMessage object to be serialized
     * @return           the byte array containing the serialized data
     * @throws Exception if an error occurs during serialization
     */
    public static byte[] serialize(CommonMessage request) throws Exception {
        log.debug("serialize enter");
        byte[] data = new byte[0];
        try {
            DatumWriter<CommonMessage> writer = new SpecificDatumWriter<>(CommonMessage.class);

            ByteArrayOutputStream stream = new ByteArrayOutputStream();
            Encoder jsonEncoder = null;
            jsonEncoder = EncoderFactory.get().jsonEncoder(CommonMessage.getClassSchema(), stream);
            writer.write(request, jsonEncoder);
            jsonEncoder.flush();
            data = stream.toByteArray();
        }
        catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        log.debug("serialize exit");
        return data;
    }

    /**
     * Deserialize the given byte array into a CommonMessage object.
     *
     * @param  data  the byte array to be deserialized
     * @return       the deserialized CommonMessage object
     * @throws Exception  if an error occurs during deserialization
     */
    public static CommonMessage deSerialize(byte[] data) throws Exception {
        log.debug("deSerialize starts");
        DatumReader<CommonMessage> reader = new SpecificDatumReader<>(CommonMessage.class);
        Decoder decoder = DecoderFactory.get().jsonDecoder(CommonMessage.getClassSchema(), new String(data));
        CommonMessage commObj = reader.read(null, decoder);
        log.debug("CommonMessage obj :::" + commObj);
        log.debug("deSerialize ends");
        return commObj;
    }
}
