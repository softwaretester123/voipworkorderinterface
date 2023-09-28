/**
 * Autogenerated by Avro
 *
 * DO NOT EDIT DIRECTLY
 */
package com.hughes.billing.voipworkorder.dto.avro.ack;

import org.apache.avro.generic.GenericArray;
import org.apache.avro.specific.SpecificData;
import org.apache.avro.util.Utf8;
import org.apache.avro.message.BinaryMessageEncoder;
import org.apache.avro.message.BinaryMessageDecoder;
import org.apache.avro.message.SchemaStore;

@org.apache.avro.specific.AvroGenerated
public class MessageData extends org.apache.avro.specific.SpecificRecordBase implements org.apache.avro.specific.SpecificRecord {
  private static final long serialVersionUID = 427377445466817048L;
  public static final org.apache.avro.Schema SCHEMA$ = new org.apache.avro.Schema.Parser().parse("{\"type\":\"record\",\"name\":\"MessageData\",\"namespace\":\"com.hughes.billing.voipworkorder.dto.avro.ack\",\"fields\":[{\"name\":\"MessageParameters\",\"type\":[\"null\",{\"type\":\"array\",\"items\":[\"null\",{\"type\":\"record\",\"name\":\"MessageParameter\",\"fields\":[{\"name\":\"name\",\"type\":[\"null\",\"string\"]},{\"name\":\"value\",\"type\":[\"null\",\"string\"]}]}]}],\"default\":null},{\"name\":\"Orders\",\"type\":[\"null\",{\"type\":\"array\",\"items\":[\"null\",{\"type\":\"record\",\"name\":\"Order\",\"fields\":[{\"name\":\"OrderInformation\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"OrderInformation\",\"fields\":[{\"name\":\"SAN\",\"type\":[\"null\",\"string\"]}]}],\"default\":null}]}]}],\"default\":null}]}");
  public static org.apache.avro.Schema getClassSchema() { return SCHEMA$; }

  private static SpecificData MODEL$ = new SpecificData();

  private static final BinaryMessageEncoder<MessageData> ENCODER =
      new BinaryMessageEncoder<MessageData>(MODEL$, SCHEMA$);

  private static final BinaryMessageDecoder<MessageData> DECODER =
      new BinaryMessageDecoder<MessageData>(MODEL$, SCHEMA$);

  /**
   * Return the BinaryMessageEncoder instance used by this class.
   * @return the message encoder used by this class
   */
  public static BinaryMessageEncoder<MessageData> getEncoder() {
    return ENCODER;
  }

  /**
   * Return the BinaryMessageDecoder instance used by this class.
   * @return the message decoder used by this class
   */
  public static BinaryMessageDecoder<MessageData> getDecoder() {
    return DECODER;
  }

  /**
   * Create a new BinaryMessageDecoder instance for this class that uses the specified {@link SchemaStore}.
   * @param resolver a {@link SchemaStore} used to find schemas by fingerprint
   * @return a BinaryMessageDecoder instance for this class backed by the given SchemaStore
   */
  public static BinaryMessageDecoder<MessageData> createDecoder(SchemaStore resolver) {
    return new BinaryMessageDecoder<MessageData>(MODEL$, SCHEMA$, resolver);
  }

  /**
   * Serializes this MessageData to a ByteBuffer.
   * @return a buffer holding the serialized data for this instance
   * @throws java.io.IOException if this instance could not be serialized
   */
  public java.nio.ByteBuffer toByteBuffer() throws java.io.IOException {
    return ENCODER.encode(this);
  }

  /**
   * Deserializes a MessageData from a ByteBuffer.
   * @param b a byte buffer holding serialized data for an instance of this class
   * @return a MessageData instance decoded from the given buffer
   * @throws java.io.IOException if the given bytes could not be deserialized into an instance of this class
   */
  public static MessageData fromByteBuffer(
      java.nio.ByteBuffer b) throws java.io.IOException {
    return DECODER.decode(b);
  }

  @Deprecated public java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter> MessageParameters;
  @Deprecated public java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.Order> Orders;

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
  public MessageData(java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter> MessageParameters, java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.Order> Orders) {
    this.MessageParameters = MessageParameters;
    this.Orders = Orders;
  }

  public org.apache.avro.specific.SpecificData getSpecificData() { return MODEL$; }
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
    case 0: MessageParameters = (java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter>)value$; break;
    case 1: Orders = (java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.Order>)value$; break;
    default: throw new org.apache.avro.AvroRuntimeException("Bad index");
    }
  }

  /**
   * Gets the value of the 'MessageParameters' field.
   * @return The value of the 'MessageParameters' field.
   */
  public java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter> getMessageParameters() {
    return MessageParameters;
  }


  /**
   * Sets the value of the 'MessageParameters' field.
   * @param value the value to set.
   */
  public void setMessageParameters(java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter> value) {
    this.MessageParameters = value;
  }

  /**
   * Gets the value of the 'Orders' field.
   * @return The value of the 'Orders' field.
   */
  public java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.Order> getOrders() {
    return Orders;
  }


  /**
   * Sets the value of the 'Orders' field.
   * @param value the value to set.
   */
  public void setOrders(java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.Order> value) {
    this.Orders = value;
  }

  /**
   * Creates a new MessageData RecordBuilder.
   * @return A new MessageData RecordBuilder
   */
  public static com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.Builder newBuilder() {
    return new com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.Builder();
  }

  /**
   * Creates a new MessageData RecordBuilder by copying an existing Builder.
   * @param other The existing builder to copy.
   * @return A new MessageData RecordBuilder
   */
  public static com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.Builder newBuilder(com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.Builder other) {
    if (other == null) {
      return new com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.Builder();
    } else {
      return new com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.Builder(other);
    }
  }

  /**
   * Creates a new MessageData RecordBuilder by copying an existing MessageData instance.
   * @param other The existing instance to copy.
   * @return A new MessageData RecordBuilder
   */
  public static com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.Builder newBuilder(com.hughes.billing.voipworkorder.dto.avro.ack.MessageData other) {
    if (other == null) {
      return new com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.Builder();
    } else {
      return new com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.Builder(other);
    }
  }

  /**
   * RecordBuilder for MessageData instances.
   */
  public static class Builder extends org.apache.avro.specific.SpecificRecordBuilderBase<MessageData>
    implements org.apache.avro.data.RecordBuilder<MessageData> {

    private java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter> MessageParameters;
    private java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.Order> Orders;

    /** Creates a new Builder */
    private Builder() {
      super(SCHEMA$);
    }

    /**
     * Creates a Builder by copying an existing Builder.
     * @param other The existing Builder to copy.
     */
    private Builder(com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.Builder other) {
      super(other);
      if (isValidValue(fields()[0], other.MessageParameters)) {
        this.MessageParameters = data().deepCopy(fields()[0].schema(), other.MessageParameters);
        fieldSetFlags()[0] = other.fieldSetFlags()[0];
      }
      if (isValidValue(fields()[1], other.Orders)) {
        this.Orders = data().deepCopy(fields()[1].schema(), other.Orders);
        fieldSetFlags()[1] = other.fieldSetFlags()[1];
      }
    }

    /**
     * Creates a Builder by copying an existing MessageData instance
     * @param other The existing instance to copy.
     */
    private Builder(com.hughes.billing.voipworkorder.dto.avro.ack.MessageData other) {
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
    public java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter> getMessageParameters() {
      return MessageParameters;
    }


    /**
      * Sets the value of the 'MessageParameters' field.
      * @param value The value of 'MessageParameters'.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.Builder setMessageParameters(java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter> value) {
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
    public com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.Builder clearMessageParameters() {
      MessageParameters = null;
      fieldSetFlags()[0] = false;
      return this;
    }

    /**
      * Gets the value of the 'Orders' field.
      * @return The value.
      */
    public java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.Order> getOrders() {
      return Orders;
    }


    /**
      * Sets the value of the 'Orders' field.
      * @param value The value of 'Orders'.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.Builder setOrders(java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.Order> value) {
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
    public com.hughes.billing.voipworkorder.dto.avro.ack.MessageData.Builder clearOrders() {
      Orders = null;
      fieldSetFlags()[1] = false;
      return this;
    }

    @Override
    @SuppressWarnings("unchecked")
    public MessageData build() {
      try {
        MessageData record = new MessageData();
        record.MessageParameters = fieldSetFlags()[0] ? this.MessageParameters : (java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter>) defaultValue(fields()[0]);
        record.Orders = fieldSetFlags()[1] ? this.Orders : (java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.Order>) defaultValue(fields()[1]);
        return record;
      } catch (org.apache.avro.AvroMissingFieldException e) {
        throw e;
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

  @Override protected boolean hasCustomCoders() { return true; }

  @Override public void customEncode(org.apache.avro.io.Encoder out)
    throws java.io.IOException
  {
    if (this.MessageParameters == null) {
      out.writeIndex(0);
      out.writeNull();
    } else {
      out.writeIndex(1);
      long size0 = this.MessageParameters.size();
      out.writeArrayStart();
      out.setItemCount(size0);
      long actualSize0 = 0;
      for (com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter e0: this.MessageParameters) {
        actualSize0++;
        out.startItem();
        if (e0 == null) {
          out.writeIndex(0);
          out.writeNull();
        } else {
          out.writeIndex(1);
          e0.customEncode(out);
        }
      }
      out.writeArrayEnd();
      if (actualSize0 != size0)
        throw new java.util.ConcurrentModificationException("Array-size written was " + size0 + ", but element count was " + actualSize0 + ".");
    }

    if (this.Orders == null) {
      out.writeIndex(0);
      out.writeNull();
    } else {
      out.writeIndex(1);
      long size1 = this.Orders.size();
      out.writeArrayStart();
      out.setItemCount(size1);
      long actualSize1 = 0;
      for (com.hughes.billing.voipworkorder.dto.avro.ack.Order e1: this.Orders) {
        actualSize1++;
        out.startItem();
        if (e1 == null) {
          out.writeIndex(0);
          out.writeNull();
        } else {
          out.writeIndex(1);
          e1.customEncode(out);
        }
      }
      out.writeArrayEnd();
      if (actualSize1 != size1)
        throw new java.util.ConcurrentModificationException("Array-size written was " + size1 + ", but element count was " + actualSize1 + ".");
    }

  }

  @Override public void customDecode(org.apache.avro.io.ResolvingDecoder in)
    throws java.io.IOException
  {
    org.apache.avro.Schema.Field[] fieldOrder = in.readFieldOrderIfDiff();
    if (fieldOrder == null) {
      if (in.readIndex() != 1) {
        in.readNull();
        this.MessageParameters = null;
      } else {
        long size0 = in.readArrayStart();
        java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter> a0 = this.MessageParameters;
        if (a0 == null) {
          a0 = new SpecificData.Array<com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter>((int)size0, SCHEMA$.getField("MessageParameters").schema().getTypes().get(1));
          this.MessageParameters = a0;
        } else a0.clear();
        SpecificData.Array<com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter> ga0 = (a0 instanceof SpecificData.Array ? (SpecificData.Array<com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter>)a0 : null);
        for ( ; 0 < size0; size0 = in.arrayNext()) {
          for ( ; size0 != 0; size0--) {
            com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter e0 = (ga0 != null ? ga0.peek() : null);
            if (in.readIndex() != 1) {
              in.readNull();
              e0 = null;
            } else {
              if (e0 == null) {
                e0 = new com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter();
              }
              e0.customDecode(in);
            }
            a0.add(e0);
          }
        }
      }

      if (in.readIndex() != 1) {
        in.readNull();
        this.Orders = null;
      } else {
        long size1 = in.readArrayStart();
        java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.Order> a1 = this.Orders;
        if (a1 == null) {
          a1 = new SpecificData.Array<com.hughes.billing.voipworkorder.dto.avro.ack.Order>((int)size1, SCHEMA$.getField("Orders").schema().getTypes().get(1));
          this.Orders = a1;
        } else a1.clear();
        SpecificData.Array<com.hughes.billing.voipworkorder.dto.avro.ack.Order> ga1 = (a1 instanceof SpecificData.Array ? (SpecificData.Array<com.hughes.billing.voipworkorder.dto.avro.ack.Order>)a1 : null);
        for ( ; 0 < size1; size1 = in.arrayNext()) {
          for ( ; size1 != 0; size1--) {
            com.hughes.billing.voipworkorder.dto.avro.ack.Order e1 = (ga1 != null ? ga1.peek() : null);
            if (in.readIndex() != 1) {
              in.readNull();
              e1 = null;
            } else {
              if (e1 == null) {
                e1 = new com.hughes.billing.voipworkorder.dto.avro.ack.Order();
              }
              e1.customDecode(in);
            }
            a1.add(e1);
          }
        }
      }

    } else {
      for (int i = 0; i < 2; i++) {
        switch (fieldOrder[i].pos()) {
        case 0:
          if (in.readIndex() != 1) {
            in.readNull();
            this.MessageParameters = null;
          } else {
            long size0 = in.readArrayStart();
            java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter> a0 = this.MessageParameters;
            if (a0 == null) {
              a0 = new SpecificData.Array<com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter>((int)size0, SCHEMA$.getField("MessageParameters").schema().getTypes().get(1));
              this.MessageParameters = a0;
            } else a0.clear();
            SpecificData.Array<com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter> ga0 = (a0 instanceof SpecificData.Array ? (SpecificData.Array<com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter>)a0 : null);
            for ( ; 0 < size0; size0 = in.arrayNext()) {
              for ( ; size0 != 0; size0--) {
                com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter e0 = (ga0 != null ? ga0.peek() : null);
                if (in.readIndex() != 1) {
                  in.readNull();
                  e0 = null;
                } else {
                  if (e0 == null) {
                    e0 = new com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter();
                  }
                  e0.customDecode(in);
                }
                a0.add(e0);
              }
            }
          }
          break;

        case 1:
          if (in.readIndex() != 1) {
            in.readNull();
            this.Orders = null;
          } else {
            long size1 = in.readArrayStart();
            java.util.List<com.hughes.billing.voipworkorder.dto.avro.ack.Order> a1 = this.Orders;
            if (a1 == null) {
              a1 = new SpecificData.Array<com.hughes.billing.voipworkorder.dto.avro.ack.Order>((int)size1, SCHEMA$.getField("Orders").schema().getTypes().get(1));
              this.Orders = a1;
            } else a1.clear();
            SpecificData.Array<com.hughes.billing.voipworkorder.dto.avro.ack.Order> ga1 = (a1 instanceof SpecificData.Array ? (SpecificData.Array<com.hughes.billing.voipworkorder.dto.avro.ack.Order>)a1 : null);
            for ( ; 0 < size1; size1 = in.arrayNext()) {
              for ( ; size1 != 0; size1--) {
                com.hughes.billing.voipworkorder.dto.avro.ack.Order e1 = (ga1 != null ? ga1.peek() : null);
                if (in.readIndex() != 1) {
                  in.readNull();
                  e1 = null;
                } else {
                  if (e1 == null) {
                    e1 = new com.hughes.billing.voipworkorder.dto.avro.ack.Order();
                  }
                  e1.customDecode(in);
                }
                a1.add(e1);
              }
            }
          }
          break;

        default:
          throw new java.io.IOException("Corrupt ResolvingDecoder.");
        }
      }
    }
  }
}










