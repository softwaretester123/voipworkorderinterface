/**
 * Autogenerated by Avro
 *
 * DO NOT EDIT DIRECTLY
 */
package com.hughes.billing.voipworkorder.dto.avro.req;

import org.apache.avro.specific.SpecificData;
import org.apache.avro.message.BinaryMessageEncoder;
import org.apache.avro.message.BinaryMessageDecoder;
import org.apache.avro.message.SchemaStore;

@SuppressWarnings("all")
@org.apache.avro.specific.AvroGenerated
public class MessageData extends org.apache.avro.specific.SpecificRecordBase implements org.apache.avro.specific.SpecificRecord {
  private static final long serialVersionUID = -2095642914498113834L;
  public static final org.apache.avro.Schema SCHEMA$ = new org.apache.avro.Schema.Parser().parse("{\"type\":\"record\",\"name\":\"MessageData\",\"namespace\":\"com.hughes.billing.voipworkorder.dto.avro.req\",\"fields\":[{\"name\":\"MessageParameters\",\"type\":{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"MessageParameters\",\"fields\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"value\",\"type\":\"string\"}]}}},{\"name\":\"Orders\",\"type\":{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"Orders\",\"fields\":[{\"name\":\"OrderInformation\",\"type\":{\"type\":\"record\",\"name\":\"OrderInformation\",\"fields\":[{\"name\":\"SAN\",\"type\":\"string\"}]}},{\"name\":\"InstallName\",\"type\":{\"type\":\"record\",\"name\":\"InstallName\",\"fields\":[{\"name\":\"FirstName\",\"type\":\"string\"},{\"name\":\"MiddleName\",\"type\":\"string\"},{\"name\":\"LastName\",\"type\":\"string\"}]}},{\"name\":\"InstallAddress\",\"type\":{\"type\":\"record\",\"name\":\"InstallAddress\",\"fields\":[{\"name\":\"Address1\",\"type\":\"string\"},{\"name\":\"Address2\",\"type\":[\"string\",\"null\"]},{\"name\":\"City\",\"type\":\"string\"},{\"name\":\"State\",\"type\":\"string\"},{\"name\":\"Zip\",\"type\":\"string\"},{\"name\":\"Country\",\"type\":\"string\"}]}},{\"name\":\"InstallPhone\",\"type\":{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"InstallPhone\",\"fields\":[{\"name\":\"Number\",\"type\":\"string\"},{\"name\":\"Type\",\"type\":[\"string\",\"null\"]}]}}},{\"name\":\"OrderAttributes\",\"type\":{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"OrderAttributes\",\"fields\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"value\",\"type\":\"string\"}]}}}]}}}]}");
  public static org.apache.avro.Schema getClassSchema() { return SCHEMA$; }

  private static SpecificData MODEL$ = new SpecificData();

  private static final BinaryMessageEncoder<MessageData> ENCODER =
      new BinaryMessageEncoder<MessageData>(MODEL$, SCHEMA$);

  private static final BinaryMessageDecoder<MessageData> DECODER =
      new BinaryMessageDecoder<MessageData>(MODEL$, SCHEMA$);

  /**
   * Return the BinaryMessageDecoder instance used by this class.
   */
  public static BinaryMessageDecoder<MessageData> getDecoder() {
    return DECODER;
  }

  /**
   * Create a new BinaryMessageDecoder instance for this class that uses the specified {@link SchemaStore}.
   * @param resolver a {@link SchemaStore} used to find schemas by fingerprint
   */
  public static BinaryMessageDecoder<MessageData> createDecoder(SchemaStore resolver) {
    return new BinaryMessageDecoder<MessageData>(MODEL$, SCHEMA$, resolver);
  }

  /** Serializes this MessageData to a ByteBuffer. */
  public java.nio.ByteBuffer toByteBuffer() throws java.io.IOException {
    return ENCODER.encode(this);
  }

  /** Deserializes a MessageData from a ByteBuffer. */
  public static MessageData fromByteBuffer(
      java.nio.ByteBuffer b) throws java.io.IOException {
    return DECODER.decode(b);
  }

  @Deprecated public java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.MessageParameters> MessageParameters;
  @Deprecated public java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.Orders> Orders;

  /**
   * Default constructor.  Note that this does not initialize fields
   * to their default values from the schema.  If that is desired then
   * one should use <code>newBuilder()</code>.
   */
  public MessageData() {}

  /**
   * All-args constructor.
   * @param MessageParameters The new value for MessageParameters
   * @param Orders The new value for Orders
   */
  public MessageData(java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.MessageParameters> MessageParameters, java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.Orders> Orders) {
    this.MessageParameters = MessageParameters;
    this.Orders = Orders;
  }

  public org.apache.avro.Schema getSchema() { return SCHEMA$; }
  // Used by DatumWriter.  Applications should not call.
  public java.lang.Object get(int field$) {
    switch (field$) {
    case 0: return MessageParameters;
    case 1: return Orders;
    default: throw new org.apache.avro.AvroRuntimeException("Bad index");
    }
  }

  // Used by DatumReader.  Applications should not call.
  @SuppressWarnings(value="unchecked")
  public void put(int field$, java.lang.Object value$) {
    switch (field$) {
    case 0: MessageParameters = (java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.MessageParameters>)value$; break;
    case 1: Orders = (java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.Orders>)value$; break;
    default: throw new org.apache.avro.AvroRuntimeException("Bad index");
    }
  }

  /**
   * Gets the value of the 'MessageParameters' field.
   * @return The value of the 'MessageParameters' field.
   */
  public java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.MessageParameters> getMessageParameters() {
    return MessageParameters;
  }

  /**
   * Sets the value of the 'MessageParameters' field.
   * @param value the value to set.
   */
  public void setMessageParameters(java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.MessageParameters> value) {
    this.MessageParameters = value;
  }

  /**
   * Gets the value of the 'Orders' field.
   * @return The value of the 'Orders' field.
   */
  public java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.Orders> getOrders() {
    return Orders;
  }

  /**
   * Sets the value of the 'Orders' field.
   * @param value the value to set.
   */
  public void setOrders(java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.Orders> value) {
    this.Orders = value;
  }

  /**
   * Creates a new MessageData RecordBuilder.
   * @return A new MessageData RecordBuilder
   */
  public static com.hughes.billing.voipworkorder.dto.avro.req.MessageData.Builder newBuilder() {
    return new com.hughes.billing.voipworkorder.dto.avro.req.MessageData.Builder();
  }

  /**
   * Creates a new MessageData RecordBuilder by copying an existing Builder.
   * @param other The existing builder to copy.
   * @return A new MessageData RecordBuilder
   */
  public static com.hughes.billing.voipworkorder.dto.avro.req.MessageData.Builder newBuilder(com.hughes.billing.voipworkorder.dto.avro.req.MessageData.Builder other) {
    return new com.hughes.billing.voipworkorder.dto.avro.req.MessageData.Builder(other);
  }

  /**
   * Creates a new MessageData RecordBuilder by copying an existing MessageData instance.
   * @param other The existing instance to copy.
   * @return A new MessageData RecordBuilder
   */
  public static com.hughes.billing.voipworkorder.dto.avro.req.MessageData.Builder newBuilder(com.hughes.billing.voipworkorder.dto.avro.req.MessageData other) {
    return new com.hughes.billing.voipworkorder.dto.avro.req.MessageData.Builder(other);
  }

  /**
   * RecordBuilder for MessageData instances.
   */
  public static class Builder extends org.apache.avro.specific.SpecificRecordBuilderBase<MessageData>
    implements org.apache.avro.data.RecordBuilder<MessageData> {

    private java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.MessageParameters> MessageParameters;
    private java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.Orders> Orders;

    /** Creates a new Builder */
    private Builder() {
      super(SCHEMA$);
    }

    /**
     * Creates a Builder by copying an existing Builder.
     * @param other The existing Builder to copy.
     */
    private Builder(com.hughes.billing.voipworkorder.dto.avro.req.MessageData.Builder other) {
      super(other);
      if (isValidValue(fields()[0], other.MessageParameters)) {
        this.MessageParameters = data().deepCopy(fields()[0].schema(), other.MessageParameters);
        fieldSetFlags()[0] = true;
      }
      if (isValidValue(fields()[1], other.Orders)) {
        this.Orders = data().deepCopy(fields()[1].schema(), other.Orders);
        fieldSetFlags()[1] = true;
      }
    }

    /**
     * Creates a Builder by copying an existing MessageData instance
     * @param other The existing instance to copy.
     */
    private Builder(com.hughes.billing.voipworkorder.dto.avro.req.MessageData other) {
            super(SCHEMA$);
      if (isValidValue(fields()[0], other.MessageParameters)) {
        this.MessageParameters = data().deepCopy(fields()[0].schema(), other.MessageParameters);
        fieldSetFlags()[0] = true;
      }
      if (isValidValue(fields()[1], other.Orders)) {
        this.Orders = data().deepCopy(fields()[1].schema(), other.Orders);
        fieldSetFlags()[1] = true;
      }
    }

    /**
      * Gets the value of the 'MessageParameters' field.
      * @return The value.
      */
    public java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.MessageParameters> getMessageParameters() {
      return MessageParameters;
    }

    /**
      * Sets the value of the 'MessageParameters' field.
      * @param value The value of 'MessageParameters'.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.req.MessageData.Builder setMessageParameters(java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.MessageParameters> value) {
      validate(fields()[0], value);
      this.MessageParameters = value;
      fieldSetFlags()[0] = true;
      return this;
    }

    /**
      * Checks whether the 'MessageParameters' field has been set.
      * @return True if the 'MessageParameters' field has been set, false otherwise.
      */
    public boolean hasMessageParameters() {
      return fieldSetFlags()[0];
    }


    /**
      * Clears the value of the 'MessageParameters' field.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.req.MessageData.Builder clearMessageParameters() {
      MessageParameters = null;
      fieldSetFlags()[0] = false;
      return this;
    }

    /**
      * Gets the value of the 'Orders' field.
      * @return The value.
      */
    public java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.Orders> getOrders() {
      return Orders;
    }

    /**
      * Sets the value of the 'Orders' field.
      * @param value The value of 'Orders'.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.req.MessageData.Builder setOrders(java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.Orders> value) {
      validate(fields()[1], value);
      this.Orders = value;
      fieldSetFlags()[1] = true;
      return this;
    }

    /**
      * Checks whether the 'Orders' field has been set.
      * @return True if the 'Orders' field has been set, false otherwise.
      */
    public boolean hasOrders() {
      return fieldSetFlags()[1];
    }


    /**
      * Clears the value of the 'Orders' field.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.req.MessageData.Builder clearOrders() {
      Orders = null;
      fieldSetFlags()[1] = false;
      return this;
    }

    @Override
    @SuppressWarnings("unchecked")
    public MessageData build() {
      try {
        MessageData record = new MessageData();
        record.MessageParameters = fieldSetFlags()[0] ? this.MessageParameters : (java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.MessageParameters>) defaultValue(fields()[0]);
        record.Orders = fieldSetFlags()[1] ? this.Orders : (java.util.List<com.hughes.billing.voipworkorder.dto.avro.req.Orders>) defaultValue(fields()[1]);
        return record;
      } catch (java.lang.Exception e) {
        throw new org.apache.avro.AvroRuntimeException(e);
      }
    }
  }

  @SuppressWarnings("unchecked")
  private static final org.apache.avro.io.DatumWriter<MessageData>
    WRITER$ = (org.apache.avro.io.DatumWriter<MessageData>)MODEL$.createDatumWriter(SCHEMA$);

  @Override public void writeExternal(java.io.ObjectOutput out)
    throws java.io.IOException {
    WRITER$.write(this, SpecificData.getEncoder(out));
  }

  @SuppressWarnings("unchecked")
  private static final org.apache.avro.io.DatumReader<MessageData>
    READER$ = (org.apache.avro.io.DatumReader<MessageData>)MODEL$.createDatumReader(SCHEMA$);

  @Override public void readExternal(java.io.ObjectInput in)
    throws java.io.IOException {
    READER$.read(this, SpecificData.getDecoder(in));
  }

}
