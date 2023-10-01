/**
 * Autogenerated by Avro
 *
 * DO NOT EDIT DIRECTLY
 */
package com.hughes.billing.voipworkorder.dto.avro.ack;

import org.apache.avro.specific.SpecificData;
import org.apache.avro.message.BinaryMessageEncoder;
import org.apache.avro.message.BinaryMessageDecoder;
import org.apache.avro.message.SchemaStore;

@SuppressWarnings("all")
@org.apache.avro.specific.AvroGenerated
public class VoIPWorkOrderAckMsg extends org.apache.avro.specific.SpecificRecordBase implements org.apache.avro.specific.SpecificRecord {
  private static final long serialVersionUID = 5540926996579970755L;
  public static final org.apache.avro.Schema SCHEMA$ = new org.apache.avro.Schema.Parser().parse("{\"type\":\"record\",\"name\":\"VoIPWorkOrderAckMsg\",\"namespace\":\"com.hughes.billing.voipworkorder.dto.avro.ack\",\"fields\":[{\"name\":\"MessageHeader\",\"type\":{\"type\":\"record\",\"name\":\"MessageHeader\",\"fields\":[{\"name\":\"TransactionSequenceId\",\"type\":\"string\"},{\"name\":\"TransactionDateTime\",\"type\":\"string\"},{\"name\":\"MessageName\",\"type\":\"string\"},{\"name\":\"Origin\",\"type\":\"string\"},{\"name\":\"CorrelationId\",\"type\":\"string\"}]}},{\"name\":\"MessageData\",\"type\":{\"type\":\"record\",\"name\":\"MessageData\",\"fields\":[{\"name\":\"MessageParameters\",\"type\":{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"MessageParameters\",\"fields\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"value\",\"type\":\"string\"}]}}},{\"name\":\"Orders\",\"type\":{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"Orders\",\"fields\":[{\"name\":\"OrderInformation\",\"type\":{\"type\":\"record\",\"name\":\"OrderInformation\",\"fields\":[{\"name\":\"SAN\",\"type\":\"string\"}]}}]}}}]}}]}");
  public static org.apache.avro.Schema getClassSchema() { return SCHEMA$; }

  private static SpecificData MODEL$ = new SpecificData();

  private static final BinaryMessageEncoder<VoIPWorkOrderAckMsg> ENCODER =
      new BinaryMessageEncoder<VoIPWorkOrderAckMsg>(MODEL$, SCHEMA$);

  private static final BinaryMessageDecoder<VoIPWorkOrderAckMsg> DECODER =
      new BinaryMessageDecoder<VoIPWorkOrderAckMsg>(MODEL$, SCHEMA$);

  /**
   * Return the BinaryMessageDecoder instance used by this class.
   */
  public static BinaryMessageDecoder<VoIPWorkOrderAckMsg> getDecoder() {
    return DECODER;
  }

  /**
   * Create a new BinaryMessageDecoder instance for this class that uses the specified {@link SchemaStore}.
   * @param resolver a {@link SchemaStore} used to find schemas by fingerprint
   */
  public static BinaryMessageDecoder<VoIPWorkOrderAckMsg> createDecoder(SchemaStore resolver) {
    return new BinaryMessageDecoder<VoIPWorkOrderAckMsg>(MODEL$, SCHEMA$, resolver);
  }

  /** Serializes this VoIPWorkOrderAckMsg to a ByteBuffer. */
  public java.nio.ByteBuffer toByteBuffer() throws java.io.IOException {
    return ENCODER.encode(this);
  }

  /** Deserializes a VoIPWorkOrderAckMsg from a ByteBuffer. */
  public static VoIPWorkOrderAckMsg fromByteBuffer(
      java.nio.ByteBuffer b) throws java.io.IOException {
    return DECODER.decode(b);
  }

  @Deprecated public com.hughes.billing.voipworkorder.dto.avro.ack.MessageHeader MessageHeader;
  @Deprecated public com.hughes.billing.voipworkorder.dto.avro.ack.MessageData MessageData;

  /**
   * Default constructor.  Note that this does not initialize fields
   * to their default values from the schema.  If that is desired then
   * one should use <code>newBuilder()</code>.
   */
  public VoIPWorkOrderAckMsg() {}

  /**
   * All-args constructor.
   * @param MessageHeader The new value for MessageHeader
   * @param MessageData The new value for MessageData
   */
  public VoIPWorkOrderAckMsg(com.hughes.billing.voipworkorder.dto.avro.ack.MessageHeader MessageHeader, com.hughes.billing.voipworkorder.dto.avro.ack.MessageData MessageData) {
    this.MessageHeader = MessageHeader;
    this.MessageData = MessageData;
  }

  public org.apache.avro.Schema getSchema() { return SCHEMA$; }
  // Used by DatumWriter.  Applications should not call.
  public java.lang.Object get(int field$) {
    switch (field$) {
    case 0: return MessageHeader;
    case 1: return MessageData;
    default: throw new org.apache.avro.AvroRuntimeException("Bad index");
    }
  }

  // Used by DatumReader.  Applications should not call.
  @SuppressWarnings(value="unchecked")
  public void put(int field$, java.lang.Object value$) {
    switch (field$) {
    case 0: MessageHeader = (com.hughes.billing.voipworkorder.dto.avro.ack.MessageHeader)value$; break;
    case 1: MessageData = (com.hughes.billing.voipworkorder.dto.avro.ack.MessageData)value$; break;
    default: throw new org.apache.avro.AvroRuntimeException("Bad index");
    }
  }

  /**
   * Gets the value of the 'MessageHeader' field.
   * @return The value of the 'MessageHeader' field.
   */
  public com.hughes.billing.voipworkorder.dto.avro.ack.MessageHeader getMessageHeader() {
    return MessageHeader;
  }

  /**
   * Sets the value of the 'MessageHeader' field.
   * @param value the value to set.
   */
  public void setMessageHeader(com.hughes.billing.voipworkorder.dto.avro.ack.MessageHeader value) {
    this.MessageHeader = value;
  }

  /**
   * Gets the value of the 'MessageData' field.
   * @return The value of the 'MessageData' field.
   */
  public com.hughes.billing.voipworkorder.dto.avro.ack.MessageData getMessageData() {
    return MessageData;
  }

  /**
   * Sets the value of the 'MessageData' field.
   * @param value the value to set.
   */
  public void setMessageData(com.hughes.billing.voipworkorder.dto.avro.ack.MessageData value) {
    this.MessageData = value;
  }

  /**
   * Creates a new VoIPWorkOrderAckMsg RecordBuilder.
   * @return A new VoIPWorkOrderAckMsg RecordBuilder
   */
  public static com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg.Builder newBuilder() {
    return new com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg.Builder();
  }

  /**
   * Creates a new VoIPWorkOrderAckMsg RecordBuilder by copying an existing Builder.
   * @param other The existing builder to copy.
   * @return A new VoIPWorkOrderAckMsg RecordBuilder
   */
  public static com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg.Builder newBuilder(com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg.Builder other) {
    return new com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg.Builder(other);
  }

  /**
   * Creates a new VoIPWorkOrderAckMsg RecordBuilder by copying an existing VoIPWorkOrderAckMsg instance.
   * @param other The existing instance to copy.
   * @return A new VoIPWorkOrderAckMsg RecordBuilder
   */
  public static com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg.Builder newBuilder(com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg other) {
    return new com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg.Builder(other);
  }

  /**
   * RecordBuilder for VoIPWorkOrderAckMsg instances.
   */
  public static class Builder extends org.apache.avro.specific.SpecificRecordBuilderBase<VoIPWorkOrderAckMsg>
    implements org.apache.avro.data.RecordBuilder<VoIPWorkOrderAckMsg> {

    private com.hughes.billing.voipworkorder.dto.avro.ack.MessageHeader MessageHeader;
    private com.hughes.billing.voipworkorder.dto.avro.ack.MessageHeader.Builder MessageHeaderBuilder;
    private com.hughes.billing.voipworkorder.dto.avro.ack.MessageData MessageData;
    private com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.Builder MessageDataBuilder;

    /** Creates a new Builder */
    private Builder() {
      super(SCHEMA$);
    }

    /**
     * Creates a Builder by copying an existing Builder.
     * @param other The existing Builder to copy.
     */
    private Builder(com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg.Builder other) {
      super(other);
      if (isValidValue(fields()[0], other.MessageHeader)) {
        this.MessageHeader = data().deepCopy(fields()[0].schema(), other.MessageHeader);
        fieldSetFlags()[0] = true;
      }
      if (other.hasMessageHeaderBuilder()) {
        this.MessageHeaderBuilder = com.hughes.billing.voipworkorder.dto.avro.ack.MessageHeader.newBuilder(other.getMessageHeaderBuilder());
      }
      if (isValidValue(fields()[1], other.MessageData)) {
        this.MessageData = data().deepCopy(fields()[1].schema(), other.MessageData);
        fieldSetFlags()[1] = true;
      }
      if (other.hasMessageDataBuilder()) {
        this.MessageDataBuilder = com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.newBuilder(other.getMessageDataBuilder());
      }
    }

    /**
     * Creates a Builder by copying an existing VoIPWorkOrderAckMsg instance
     * @param other The existing instance to copy.
     */
    private Builder(com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg other) {
            super(SCHEMA$);
      if (isValidValue(fields()[0], other.MessageHeader)) {
        this.MessageHeader = data().deepCopy(fields()[0].schema(), other.MessageHeader);
        fieldSetFlags()[0] = true;
      }
      this.MessageHeaderBuilder = null;
      if (isValidValue(fields()[1], other.MessageData)) {
        this.MessageData = data().deepCopy(fields()[1].schema(), other.MessageData);
        fieldSetFlags()[1] = true;
      }
      this.MessageDataBuilder = null;
    }

    /**
      * Gets the value of the 'MessageHeader' field.
      * @return The value.
      */
    public com.hughes.billing.voipworkorder.dto.avro.ack.MessageHeader getMessageHeader() {
      return MessageHeader;
    }

    /**
      * Sets the value of the 'MessageHeader' field.
      * @param value The value of 'MessageHeader'.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg.Builder setMessageHeader(com.hughes.billing.voipworkorder.dto.avro.ack.MessageHeader value) {
      validate(fields()[0], value);
      this.MessageHeaderBuilder = null;
      this.MessageHeader = value;
      fieldSetFlags()[0] = true;
      return this;
    }

    /**
      * Checks whether the 'MessageHeader' field has been set.
      * @return True if the 'MessageHeader' field has been set, false otherwise.
      */
    public boolean hasMessageHeader() {
      return fieldSetFlags()[0];
    }

    /**
     * Gets the Builder instance for the 'MessageHeader' field and creates one if it doesn't exist yet.
     * @return This builder.
     */
    public com.hughes.billing.voipworkorder.dto.avro.ack.MessageHeader.Builder getMessageHeaderBuilder() {
      if (MessageHeaderBuilder == null) {
        if (hasMessageHeader()) {
          setMessageHeaderBuilder(com.hughes.billing.voipworkorder.dto.avro.ack.MessageHeader.newBuilder(MessageHeader));
        } else {
          setMessageHeaderBuilder(com.hughes.billing.voipworkorder.dto.avro.ack.MessageHeader.newBuilder());
        }
      }
      return MessageHeaderBuilder;
    }

    /**
     * Sets the Builder instance for the 'MessageHeader' field
     * @param value The builder instance that must be set.
     * @return This builder.
     */
    public com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg.Builder setMessageHeaderBuilder(com.hughes.billing.voipworkorder.dto.avro.ack.MessageHeader.Builder value) {
      clearMessageHeader();
      MessageHeaderBuilder = value;
      return this;
    }

    /**
     * Checks whether the 'MessageHeader' field has an active Builder instance
     * @return True if the 'MessageHeader' field has an active Builder instance
     */
    public boolean hasMessageHeaderBuilder() {
      return MessageHeaderBuilder != null;
    }

    /**
      * Clears the value of the 'MessageHeader' field.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg.Builder clearMessageHeader() {
      MessageHeader = null;
      MessageHeaderBuilder = null;
      fieldSetFlags()[0] = false;
      return this;
    }

    /**
      * Gets the value of the 'MessageData' field.
      * @return The value.
      */
    public com.hughes.billing.voipworkorder.dto.avro.ack.MessageData getMessageData() {
      return MessageData;
    }

    /**
      * Sets the value of the 'MessageData' field.
      * @param value The value of 'MessageData'.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg.Builder setMessageData(com.hughes.billing.voipworkorder.dto.avro.ack.MessageData value) {
      validate(fields()[1], value);
      this.MessageDataBuilder = null;
      this.MessageData = value;
      fieldSetFlags()[1] = true;
      return this;
    }

    /**
      * Checks whether the 'MessageData' field has been set.
      * @return True if the 'MessageData' field has been set, false otherwise.
      */
    public boolean hasMessageData() {
      return fieldSetFlags()[1];
    }

    /**
     * Gets the Builder instance for the 'MessageData' field and creates one if it doesn't exist yet.
     * @return This builder.
     */
    public com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.Builder getMessageDataBuilder() {
      if (MessageDataBuilder == null) {
        if (hasMessageData()) {
          setMessageDataBuilder(com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.newBuilder(MessageData));
        } else {
          setMessageDataBuilder(com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.newBuilder());
        }
      }
      return MessageDataBuilder;
    }

    /**
     * Sets the Builder instance for the 'MessageData' field
     * @param value The builder instance that must be set.
     * @return This builder.
     */
    public com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg.Builder setMessageDataBuilder(com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.Builder value) {
      clearMessageData();
      MessageDataBuilder = value;
      return this;
    }

    /**
     * Checks whether the 'MessageData' field has an active Builder instance
     * @return True if the 'MessageData' field has an active Builder instance
     */
    public boolean hasMessageDataBuilder() {
      return MessageDataBuilder != null;
    }

    /**
      * Clears the value of the 'MessageData' field.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg.Builder clearMessageData() {
      MessageData = null;
      MessageDataBuilder = null;
      fieldSetFlags()[1] = false;
      return this;
    }

    @Override
    @SuppressWarnings("unchecked")
    public VoIPWorkOrderAckMsg build() {
      try {
        VoIPWorkOrderAckMsg record = new VoIPWorkOrderAckMsg();
        if (MessageHeaderBuilder != null) {
          record.MessageHeader = this.MessageHeaderBuilder.build();
        } else {
          record.MessageHeader = fieldSetFlags()[0] ? this.MessageHeader : (com.hughes.billing.voipworkorder.dto.avro.ack.MessageHeader) defaultValue(fields()[0]);
        }
        if (MessageDataBuilder != null) {
          record.MessageData = this.MessageDataBuilder.build();
        } else {
          record.MessageData = fieldSetFlags()[1] ? this.MessageData : (com.hughes.billing.voipworkorder.dto.avro.ack.MessageData) defaultValue(fields()[1]);
        }
        return record;
      } catch (java.lang.Exception e) {
        throw new org.apache.avro.AvroRuntimeException(e);
      }
    }
  }

  @SuppressWarnings("unchecked")
  private static final org.apache.avro.io.DatumWriter<VoIPWorkOrderAckMsg>
    WRITER$ = (org.apache.avro.io.DatumWriter<VoIPWorkOrderAckMsg>)MODEL$.createDatumWriter(SCHEMA$);

  @Override public void writeExternal(java.io.ObjectOutput out)
    throws java.io.IOException {
    WRITER$.write(this, SpecificData.getEncoder(out));
  }

  @SuppressWarnings("unchecked")
  private static final org.apache.avro.io.DatumReader<VoIPWorkOrderAckMsg>
    READER$ = (org.apache.avro.io.DatumReader<VoIPWorkOrderAckMsg>)MODEL$.createDatumReader(SCHEMA$);

  @Override public void readExternal(java.io.ObjectInput in)
    throws java.io.IOException {
    READER$.read(this, SpecificData.getDecoder(in));
  }

}
