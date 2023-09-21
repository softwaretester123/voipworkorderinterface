/**
 * Autogenerated by Avro
 *
 * DO NOT EDIT DIRECTLY
 */
package com.hughes.billing.voipworkorder.dto.avro;

import org.apache.avro.specific.SpecificData;
import org.apache.avro.message.BinaryMessageEncoder;
import org.apache.avro.message.BinaryMessageDecoder;
import org.apache.avro.message.SchemaStore;

@SuppressWarnings("all")
@org.apache.avro.specific.AvroGenerated
public class Order extends org.apache.avro.specific.SpecificRecordBase implements org.apache.avro.specific.SpecificRecord {
  private static final long serialVersionUID = -5829617374625272700L;
  public static final org.apache.avro.Schema SCHEMA$ = new org.apache.avro.Schema.Parser().parse("{\"type\":\"record\",\"name\":\"Order\",\"namespace\":\"com.hughes.billing.voipworkorder.dto.avro\",\"fields\":[{\"name\":\"InstallAddress\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"InstallAddress\",\"fields\":[{\"name\":\"Address1\",\"type\":[\"null\",\"string\"]},{\"name\":\"Address2\",\"type\":\"null\"},{\"name\":\"City\",\"type\":[\"null\",\"string\"]},{\"name\":\"Country\",\"type\":[\"null\",\"string\"]},{\"name\":\"State\",\"type\":[\"null\",\"string\"]},{\"name\":\"Zip\",\"type\":[\"null\",\"string\"]}]}],\"default\":null},{\"name\":\"InstallName\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"InstallName\",\"fields\":[{\"name\":\"FirstName\",\"type\":[\"null\",\"string\"]},{\"name\":\"LastName\",\"type\":[\"null\",\"string\"]},{\"name\":\"MiddleName\",\"type\":[\"null\",\"string\"]}]}],\"default\":null},{\"name\":\"InstallPhone\",\"type\":[\"null\",{\"type\":\"array\",\"items\":[\"null\",{\"type\":\"record\",\"name\":\"InstallPhone\",\"fields\":[{\"name\":\"Number\",\"type\":[\"null\",\"string\"]},{\"name\":\"Type\",\"type\":[\"null\",\"string\"]}]}]}],\"default\":null},{\"name\":\"OrderAttributes\",\"type\":[\"null\",{\"type\":\"array\",\"items\":[\"null\",{\"type\":\"record\",\"name\":\"OrderAttribute\",\"fields\":[{\"name\":\"name\",\"type\":[\"null\",\"string\"]},{\"name\":\"value\",\"type\":[\"null\",\"string\"]}]}]}],\"default\":null},{\"name\":\"OrderInformation\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"OrderInformation\",\"fields\":[{\"name\":\"SAN\",\"type\":[\"null\",\"string\"]}]}],\"default\":null}]}");
  public static org.apache.avro.Schema getClassSchema() { return SCHEMA$; }

  private static SpecificData MODEL$ = new SpecificData();

  private static final BinaryMessageEncoder<Order> ENCODER =
      new BinaryMessageEncoder<Order>(MODEL$, SCHEMA$);

  private static final BinaryMessageDecoder<Order> DECODER =
      new BinaryMessageDecoder<Order>(MODEL$, SCHEMA$);

  /**
   * Return the BinaryMessageDecoder instance used by this class.
   */
  public static BinaryMessageDecoder<Order> getDecoder() {
    return DECODER;
  }

  /**
   * Create a new BinaryMessageDecoder instance for this class that uses the specified {@link SchemaStore}.
   * @param resolver a {@link SchemaStore} used to find schemas by fingerprint
   */
  public static BinaryMessageDecoder<Order> createDecoder(SchemaStore resolver) {
    return new BinaryMessageDecoder<Order>(MODEL$, SCHEMA$, resolver);
  }

  /** Serializes this Order to a ByteBuffer. */
  public java.nio.ByteBuffer toByteBuffer() throws java.io.IOException {
    return ENCODER.encode(this);
  }

  /** Deserializes a Order from a ByteBuffer. */
  public static Order fromByteBuffer(
      java.nio.ByteBuffer b) throws java.io.IOException {
    return DECODER.decode(b);
  }

  @Deprecated public com.hughes.billing.voipworkorder.dto.avro.InstallAddress InstallAddress;
  @Deprecated public com.hughes.billing.voipworkorder.dto.avro.InstallName InstallName;
  @Deprecated public java.util.List<com.hughes.billing.voipworkorder.dto.avro.InstallPhone> InstallPhone;
  @Deprecated public java.util.List<com.hughes.billing.voipworkorder.dto.avro.OrderAttribute> OrderAttributes;
  @Deprecated public com.hughes.billing.voipworkorder.dto.avro.OrderInformation OrderInformation;

  /**
   * Default constructor.  Note that this does not initialize fields
   * to their default values from the schema.  If that is desired then
   * one should use <code>newBuilder()</code>.
   */
  public Order() {}

  /**
   * All-args constructor.
   * @param InstallAddress The new value for InstallAddress
   * @param InstallName The new value for InstallName
   * @param InstallPhone The new value for InstallPhone
   * @param OrderAttributes The new value for OrderAttributes
   * @param OrderInformation The new value for OrderInformation
   */
  public Order(com.hughes.billing.voipworkorder.dto.avro.InstallAddress InstallAddress, com.hughes.billing.voipworkorder.dto.avro.InstallName InstallName, java.util.List<com.hughes.billing.voipworkorder.dto.avro.InstallPhone> InstallPhone, java.util.List<com.hughes.billing.voipworkorder.dto.avro.OrderAttribute> OrderAttributes, com.hughes.billing.voipworkorder.dto.avro.OrderInformation OrderInformation) {
    this.InstallAddress = InstallAddress;
    this.InstallName = InstallName;
    this.InstallPhone = InstallPhone;
    this.OrderAttributes = OrderAttributes;
    this.OrderInformation = OrderInformation;
  }

  public org.apache.avro.Schema getSchema() { return SCHEMA$; }
  // Used by DatumWriter.  Applications should not call.
  public java.lang.Object get(int field$) {
    switch (field$) {
    case 0: return InstallAddress;
    case 1: return InstallName;
    case 2: return InstallPhone;
    case 3: return OrderAttributes;
    case 4: return OrderInformation;
    default: throw new org.apache.avro.AvroRuntimeException("Bad index");
    }
  }

  // Used by DatumReader.  Applications should not call.
  @SuppressWarnings(value="unchecked")
  public void put(int field$, java.lang.Object value$) {
    switch (field$) {
    case 0: InstallAddress = (com.hughes.billing.voipworkorder.dto.avro.InstallAddress)value$; break;
    case 1: InstallName = (com.hughes.billing.voipworkorder.dto.avro.InstallName)value$; break;
    case 2: InstallPhone = (java.util.List<com.hughes.billing.voipworkorder.dto.avro.InstallPhone>)value$; break;
    case 3: OrderAttributes = (java.util.List<com.hughes.billing.voipworkorder.dto.avro.OrderAttribute>)value$; break;
    case 4: OrderInformation = (com.hughes.billing.voipworkorder.dto.avro.OrderInformation)value$; break;
    default: throw new org.apache.avro.AvroRuntimeException("Bad index");
    }
  }

  /**
   * Gets the value of the 'InstallAddress' field.
   * @return The value of the 'InstallAddress' field.
   */
  public com.hughes.billing.voipworkorder.dto.avro.InstallAddress getInstallAddress() {
    return InstallAddress;
  }

  /**
   * Sets the value of the 'InstallAddress' field.
   * @param value the value to set.
   */
  public void setInstallAddress(com.hughes.billing.voipworkorder.dto.avro.InstallAddress value) {
    this.InstallAddress = value;
  }

  /**
   * Gets the value of the 'InstallName' field.
   * @return The value of the 'InstallName' field.
   */
  public com.hughes.billing.voipworkorder.dto.avro.InstallName getInstallName() {
    return InstallName;
  }

  /**
   * Sets the value of the 'InstallName' field.
   * @param value the value to set.
   */
  public void setInstallName(com.hughes.billing.voipworkorder.dto.avro.InstallName value) {
    this.InstallName = value;
  }

  /**
   * Gets the value of the 'InstallPhone' field.
   * @return The value of the 'InstallPhone' field.
   */
  public java.util.List<com.hughes.billing.voipworkorder.dto.avro.InstallPhone> getInstallPhone() {
    return InstallPhone;
  }

  /**
   * Sets the value of the 'InstallPhone' field.
   * @param value the value to set.
   */
  public void setInstallPhone(java.util.List<com.hughes.billing.voipworkorder.dto.avro.InstallPhone> value) {
    this.InstallPhone = value;
  }

  /**
   * Gets the value of the 'OrderAttributes' field.
   * @return The value of the 'OrderAttributes' field.
   */
  public java.util.List<com.hughes.billing.voipworkorder.dto.avro.OrderAttribute> getOrderAttributes() {
    return OrderAttributes;
  }

  /**
   * Sets the value of the 'OrderAttributes' field.
   * @param value the value to set.
   */
  public void setOrderAttributes(java.util.List<com.hughes.billing.voipworkorder.dto.avro.OrderAttribute> value) {
    this.OrderAttributes = value;
  }

  /**
   * Gets the value of the 'OrderInformation' field.
   * @return The value of the 'OrderInformation' field.
   */
  public com.hughes.billing.voipworkorder.dto.avro.OrderInformation getOrderInformation() {
    return OrderInformation;
  }

  /**
   * Sets the value of the 'OrderInformation' field.
   * @param value the value to set.
   */
  public void setOrderInformation(com.hughes.billing.voipworkorder.dto.avro.OrderInformation value) {
    this.OrderInformation = value;
  }

  /**
   * Creates a new Order RecordBuilder.
   * @return A new Order RecordBuilder
   */
  public static com.hughes.billing.voipworkorder.dto.avro.Order.Builder newBuilder() {
    return new com.hughes.billing.voipworkorder.dto.avro.Order.Builder();
  }

  /**
   * Creates a new Order RecordBuilder by copying an existing Builder.
   * @param other The existing builder to copy.
   * @return A new Order RecordBuilder
   */
  public static com.hughes.billing.voipworkorder.dto.avro.Order.Builder newBuilder(com.hughes.billing.voipworkorder.dto.avro.Order.Builder other) {
    return new com.hughes.billing.voipworkorder.dto.avro.Order.Builder(other);
  }

  /**
   * Creates a new Order RecordBuilder by copying an existing Order instance.
   * @param other The existing instance to copy.
   * @return A new Order RecordBuilder
   */
  public static com.hughes.billing.voipworkorder.dto.avro.Order.Builder newBuilder(com.hughes.billing.voipworkorder.dto.avro.Order other) {
    return new com.hughes.billing.voipworkorder.dto.avro.Order.Builder(other);
  }

  /**
   * RecordBuilder for Order instances.
   */
  public static class Builder extends org.apache.avro.specific.SpecificRecordBuilderBase<Order>
    implements org.apache.avro.data.RecordBuilder<Order> {

    private com.hughes.billing.voipworkorder.dto.avro.InstallAddress InstallAddress;
    private com.hughes.billing.voipworkorder.dto.avro.InstallAddress.Builder InstallAddressBuilder;
    private com.hughes.billing.voipworkorder.dto.avro.InstallName InstallName;
    private com.hughes.billing.voipworkorder.dto.avro.InstallName.Builder InstallNameBuilder;
    private java.util.List<com.hughes.billing.voipworkorder.dto.avro.InstallPhone> InstallPhone;
    private java.util.List<com.hughes.billing.voipworkorder.dto.avro.OrderAttribute> OrderAttributes;
    private com.hughes.billing.voipworkorder.dto.avro.OrderInformation OrderInformation;
    private com.hughes.billing.voipworkorder.dto.avro.OrderInformation.Builder OrderInformationBuilder;

    /** Creates a new Builder */
    private Builder() {
      super(SCHEMA$);
    }

    /**
     * Creates a Builder by copying an existing Builder.
     * @param other The existing Builder to copy.
     */
    private Builder(com.hughes.billing.voipworkorder.dto.avro.Order.Builder other) {
      super(other);
      if (isValidValue(fields()[0], other.InstallAddress)) {
        this.InstallAddress = data().deepCopy(fields()[0].schema(), other.InstallAddress);
        fieldSetFlags()[0] = true;
      }
      if (other.hasInstallAddressBuilder()) {
        this.InstallAddressBuilder = com.hughes.billing.voipworkorder.dto.avro.InstallAddress.newBuilder(other.getInstallAddressBuilder());
      }
      if (isValidValue(fields()[1], other.InstallName)) {
        this.InstallName = data().deepCopy(fields()[1].schema(), other.InstallName);
        fieldSetFlags()[1] = true;
      }
      if (other.hasInstallNameBuilder()) {
        this.InstallNameBuilder = com.hughes.billing.voipworkorder.dto.avro.InstallName.newBuilder(other.getInstallNameBuilder());
      }
      if (isValidValue(fields()[2], other.InstallPhone)) {
        this.InstallPhone = data().deepCopy(fields()[2].schema(), other.InstallPhone);
        fieldSetFlags()[2] = true;
      }
      if (isValidValue(fields()[3], other.OrderAttributes)) {
        this.OrderAttributes = data().deepCopy(fields()[3].schema(), other.OrderAttributes);
        fieldSetFlags()[3] = true;
      }
      if (isValidValue(fields()[4], other.OrderInformation)) {
        this.OrderInformation = data().deepCopy(fields()[4].schema(), other.OrderInformation);
        fieldSetFlags()[4] = true;
      }
      if (other.hasOrderInformationBuilder()) {
        this.OrderInformationBuilder = com.hughes.billing.voipworkorder.dto.avro.OrderInformation.newBuilder(other.getOrderInformationBuilder());
      }
    }

    /**
     * Creates a Builder by copying an existing Order instance
     * @param other The existing instance to copy.
     */
    private Builder(com.hughes.billing.voipworkorder.dto.avro.Order other) {
            super(SCHEMA$);
      if (isValidValue(fields()[0], other.InstallAddress)) {
        this.InstallAddress = data().deepCopy(fields()[0].schema(), other.InstallAddress);
        fieldSetFlags()[0] = true;
      }
      this.InstallAddressBuilder = null;
      if (isValidValue(fields()[1], other.InstallName)) {
        this.InstallName = data().deepCopy(fields()[1].schema(), other.InstallName);
        fieldSetFlags()[1] = true;
      }
      this.InstallNameBuilder = null;
      if (isValidValue(fields()[2], other.InstallPhone)) {
        this.InstallPhone = data().deepCopy(fields()[2].schema(), other.InstallPhone);
        fieldSetFlags()[2] = true;
      }
      if (isValidValue(fields()[3], other.OrderAttributes)) {
        this.OrderAttributes = data().deepCopy(fields()[3].schema(), other.OrderAttributes);
        fieldSetFlags()[3] = true;
      }
      if (isValidValue(fields()[4], other.OrderInformation)) {
        this.OrderInformation = data().deepCopy(fields()[4].schema(), other.OrderInformation);
        fieldSetFlags()[4] = true;
      }
      this.OrderInformationBuilder = null;
    }

    /**
      * Gets the value of the 'InstallAddress' field.
      * @return The value.
      */
    public com.hughes.billing.voipworkorder.dto.avro.InstallAddress getInstallAddress() {
      return InstallAddress;
    }

    /**
      * Sets the value of the 'InstallAddress' field.
      * @param value The value of 'InstallAddress'.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.Order.Builder setInstallAddress(com.hughes.billing.voipworkorder.dto.avro.InstallAddress value) {
      validate(fields()[0], value);
      this.InstallAddressBuilder = null;
      this.InstallAddress = value;
      fieldSetFlags()[0] = true;
      return this;
    }

    /**
      * Checks whether the 'InstallAddress' field has been set.
      * @return True if the 'InstallAddress' field has been set, false otherwise.
      */
    public boolean hasInstallAddress() {
      return fieldSetFlags()[0];
    }

    /**
     * Gets the Builder instance for the 'InstallAddress' field and creates one if it doesn't exist yet.
     * @return This builder.
     */
    public com.hughes.billing.voipworkorder.dto.avro.InstallAddress.Builder getInstallAddressBuilder() {
      if (InstallAddressBuilder == null) {
        if (hasInstallAddress()) {
          setInstallAddressBuilder(com.hughes.billing.voipworkorder.dto.avro.InstallAddress.newBuilder(InstallAddress));
        } else {
          setInstallAddressBuilder(com.hughes.billing.voipworkorder.dto.avro.InstallAddress.newBuilder());
        }
      }
      return InstallAddressBuilder;
    }

    /**
     * Sets the Builder instance for the 'InstallAddress' field
     * @param value The builder instance that must be set.
     * @return This builder.
     */
    public com.hughes.billing.voipworkorder.dto.avro.Order.Builder setInstallAddressBuilder(com.hughes.billing.voipworkorder.dto.avro.InstallAddress.Builder value) {
      clearInstallAddress();
      InstallAddressBuilder = value;
      return this;
    }

    /**
     * Checks whether the 'InstallAddress' field has an active Builder instance
     * @return True if the 'InstallAddress' field has an active Builder instance
     */
    public boolean hasInstallAddressBuilder() {
      return InstallAddressBuilder != null;
    }

    /**
      * Clears the value of the 'InstallAddress' field.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.Order.Builder clearInstallAddress() {
      InstallAddress = null;
      InstallAddressBuilder = null;
      fieldSetFlags()[0] = false;
      return this;
    }

    /**
      * Gets the value of the 'InstallName' field.
      * @return The value.
      */
    public com.hughes.billing.voipworkorder.dto.avro.InstallName getInstallName() {
      return InstallName;
    }

    /**
      * Sets the value of the 'InstallName' field.
      * @param value The value of 'InstallName'.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.Order.Builder setInstallName(com.hughes.billing.voipworkorder.dto.avro.InstallName value) {
      validate(fields()[1], value);
      this.InstallNameBuilder = null;
      this.InstallName = value;
      fieldSetFlags()[1] = true;
      return this;
    }

    /**
      * Checks whether the 'InstallName' field has been set.
      * @return True if the 'InstallName' field has been set, false otherwise.
      */
    public boolean hasInstallName() {
      return fieldSetFlags()[1];
    }

    /**
     * Gets the Builder instance for the 'InstallName' field and creates one if it doesn't exist yet.
     * @return This builder.
     */
    public com.hughes.billing.voipworkorder.dto.avro.InstallName.Builder getInstallNameBuilder() {
      if (InstallNameBuilder == null) {
        if (hasInstallName()) {
          setInstallNameBuilder(com.hughes.billing.voipworkorder.dto.avro.InstallName.newBuilder(InstallName));
        } else {
          setInstallNameBuilder(com.hughes.billing.voipworkorder.dto.avro.InstallName.newBuilder());
        }
      }
      return InstallNameBuilder;
    }

    /**
     * Sets the Builder instance for the 'InstallName' field
     * @param value The builder instance that must be set.
     * @return This builder.
     */
    public com.hughes.billing.voipworkorder.dto.avro.Order.Builder setInstallNameBuilder(com.hughes.billing.voipworkorder.dto.avro.InstallName.Builder value) {
      clearInstallName();
      InstallNameBuilder = value;
      return this;
    }

    /**
     * Checks whether the 'InstallName' field has an active Builder instance
     * @return True if the 'InstallName' field has an active Builder instance
     */
    public boolean hasInstallNameBuilder() {
      return InstallNameBuilder != null;
    }

    /**
      * Clears the value of the 'InstallName' field.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.Order.Builder clearInstallName() {
      InstallName = null;
      InstallNameBuilder = null;
      fieldSetFlags()[1] = false;
      return this;
    }

    /**
      * Gets the value of the 'InstallPhone' field.
      * @return The value.
      */
    public java.util.List<com.hughes.billing.voipworkorder.dto.avro.InstallPhone> getInstallPhone() {
      return InstallPhone;
    }

    /**
      * Sets the value of the 'InstallPhone' field.
      * @param value The value of 'InstallPhone'.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.Order.Builder setInstallPhone(java.util.List<com.hughes.billing.voipworkorder.dto.avro.InstallPhone> value) {
      validate(fields()[2], value);
      this.InstallPhone = value;
      fieldSetFlags()[2] = true;
      return this;
    }

    /**
      * Checks whether the 'InstallPhone' field has been set.
      * @return True if the 'InstallPhone' field has been set, false otherwise.
      */
    public boolean hasInstallPhone() {
      return fieldSetFlags()[2];
    }


    /**
      * Clears the value of the 'InstallPhone' field.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.Order.Builder clearInstallPhone() {
      InstallPhone = null;
      fieldSetFlags()[2] = false;
      return this;
    }

    /**
      * Gets the value of the 'OrderAttributes' field.
      * @return The value.
      */
    public java.util.List<com.hughes.billing.voipworkorder.dto.avro.OrderAttribute> getOrderAttributes() {
      return OrderAttributes;
    }

    /**
      * Sets the value of the 'OrderAttributes' field.
      * @param value The value of 'OrderAttributes'.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.Order.Builder setOrderAttributes(java.util.List<com.hughes.billing.voipworkorder.dto.avro.OrderAttribute> value) {
      validate(fields()[3], value);
      this.OrderAttributes = value;
      fieldSetFlags()[3] = true;
      return this;
    }

    /**
      * Checks whether the 'OrderAttributes' field has been set.
      * @return True if the 'OrderAttributes' field has been set, false otherwise.
      */
    public boolean hasOrderAttributes() {
      return fieldSetFlags()[3];
    }


    /**
      * Clears the value of the 'OrderAttributes' field.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.Order.Builder clearOrderAttributes() {
      OrderAttributes = null;
      fieldSetFlags()[3] = false;
      return this;
    }

    /**
      * Gets the value of the 'OrderInformation' field.
      * @return The value.
      */
    public com.hughes.billing.voipworkorder.dto.avro.OrderInformation getOrderInformation() {
      return OrderInformation;
    }

    /**
      * Sets the value of the 'OrderInformation' field.
      * @param value The value of 'OrderInformation'.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.Order.Builder setOrderInformation(com.hughes.billing.voipworkorder.dto.avro.OrderInformation value) {
      validate(fields()[4], value);
      this.OrderInformationBuilder = null;
      this.OrderInformation = value;
      fieldSetFlags()[4] = true;
      return this;
    }

    /**
      * Checks whether the 'OrderInformation' field has been set.
      * @return True if the 'OrderInformation' field has been set, false otherwise.
      */
    public boolean hasOrderInformation() {
      return fieldSetFlags()[4];
    }

    /**
     * Gets the Builder instance for the 'OrderInformation' field and creates one if it doesn't exist yet.
     * @return This builder.
     */
    public com.hughes.billing.voipworkorder.dto.avro.OrderInformation.Builder getOrderInformationBuilder() {
      if (OrderInformationBuilder == null) {
        if (hasOrderInformation()) {
          setOrderInformationBuilder(com.hughes.billing.voipworkorder.dto.avro.OrderInformation.newBuilder(OrderInformation));
        } else {
          setOrderInformationBuilder(com.hughes.billing.voipworkorder.dto.avro.OrderInformation.newBuilder());
        }
      }
      return OrderInformationBuilder;
    }

    /**
     * Sets the Builder instance for the 'OrderInformation' field
     * @param value The builder instance that must be set.
     * @return This builder.
     */
    public com.hughes.billing.voipworkorder.dto.avro.Order.Builder setOrderInformationBuilder(com.hughes.billing.voipworkorder.dto.avro.OrderInformation.Builder value) {
      clearOrderInformation();
      OrderInformationBuilder = value;
      return this;
    }

    /**
     * Checks whether the 'OrderInformation' field has an active Builder instance
     * @return True if the 'OrderInformation' field has an active Builder instance
     */
    public boolean hasOrderInformationBuilder() {
      return OrderInformationBuilder != null;
    }

    /**
      * Clears the value of the 'OrderInformation' field.
      * @return This builder.
      */
    public com.hughes.billing.voipworkorder.dto.avro.Order.Builder clearOrderInformation() {
      OrderInformation = null;
      OrderInformationBuilder = null;
      fieldSetFlags()[4] = false;
      return this;
    }

    @Override
    @SuppressWarnings("unchecked")
    public Order build() {
      try {
        Order record = new Order();
        if (InstallAddressBuilder != null) {
          record.InstallAddress = this.InstallAddressBuilder.build();
        } else {
          record.InstallAddress = fieldSetFlags()[0] ? this.InstallAddress : (com.hughes.billing.voipworkorder.dto.avro.InstallAddress) defaultValue(fields()[0]);
        }
        if (InstallNameBuilder != null) {
          record.InstallName = this.InstallNameBuilder.build();
        } else {
          record.InstallName = fieldSetFlags()[1] ? this.InstallName : (com.hughes.billing.voipworkorder.dto.avro.InstallName) defaultValue(fields()[1]);
        }
        record.InstallPhone = fieldSetFlags()[2] ? this.InstallPhone : (java.util.List<com.hughes.billing.voipworkorder.dto.avro.InstallPhone>) defaultValue(fields()[2]);
        record.OrderAttributes = fieldSetFlags()[3] ? this.OrderAttributes : (java.util.List<com.hughes.billing.voipworkorder.dto.avro.OrderAttribute>) defaultValue(fields()[3]);
        if (OrderInformationBuilder != null) {
          record.OrderInformation = this.OrderInformationBuilder.build();
        } else {
          record.OrderInformation = fieldSetFlags()[4] ? this.OrderInformation : (com.hughes.billing.voipworkorder.dto.avro.OrderInformation) defaultValue(fields()[4]);
        }
        return record;
      } catch (java.lang.Exception e) {
        throw new org.apache.avro.AvroRuntimeException(e);
      }
    }
  }

  @SuppressWarnings("unchecked")
  private static final org.apache.avro.io.DatumWriter<Order>
    WRITER$ = (org.apache.avro.io.DatumWriter<Order>)MODEL$.createDatumWriter(SCHEMA$);

  @Override public void writeExternal(java.io.ObjectOutput out)
    throws java.io.IOException {
    WRITER$.write(this, SpecificData.getEncoder(out));
  }

  @SuppressWarnings("unchecked")
  private static final org.apache.avro.io.DatumReader<Order>
    READER$ = (org.apache.avro.io.DatumReader<Order>)MODEL$.createDatumReader(SCHEMA$);

  @Override public void readExternal(java.io.ObjectInput in)
    throws java.io.IOException {
    READER$.read(this, SpecificData.getDecoder(in));
  }

}
