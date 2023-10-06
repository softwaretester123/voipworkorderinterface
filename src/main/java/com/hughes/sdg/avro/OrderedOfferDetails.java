/**
 * Autogenerated by Avro
 *
 * DO NOT EDIT DIRECTLY
 */
package com.hughes.sdg.avro;

import org.apache.avro.specific.SpecificData;
import org.apache.avro.message.BinaryMessageEncoder;
import org.apache.avro.message.BinaryMessageDecoder;
import org.apache.avro.message.SchemaStore;

@SuppressWarnings("all")
@org.apache.avro.specific.AvroGenerated
public class OrderedOfferDetails extends org.apache.avro.specific.SpecificRecordBase implements org.apache.avro.specific.SpecificRecord {
  private static final long serialVersionUID = -7525033237727025667L;
  public static final org.apache.avro.Schema SCHEMA$ = new org.apache.avro.Schema.Parser().parse("{\"type\":\"record\",\"name\":\"OrderedOfferDetails\",\"namespace\":\"com.hughes.sdg.avro\",\"fields\":[{\"name\":\"OfferName\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ProgramId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"PackageId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ProgramCd\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ProgramNm\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"PackageNm\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"Subscriptions\",\"type\":[\"null\",{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"Subscription\",\"fields\":[{\"name\":\"SubscriptionId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"SubscriptionStatusCd\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"Description\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ProvisioningDt\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"PlanId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"PlanNm\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ServiceOfferingId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ServiceOfferingNm\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ServiceDealId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ServiceDealNm\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ServiceDealAttributes\",\"type\":[\"null\",{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"NameValueParameter\",\"namespace\":\"com.hughes.sdg.avro.types\",\"fields\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"value\",\"type\":\"string\"}]}}],\"default\":null},{\"name\":\"BillingDealId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"BillingDealNm\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"BillingDealAttributes\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"com.hughes.sdg.avro.types.NameValueParameter\"}],\"default\":null},{\"name\":\"ServiceNm\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ExtraParams\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"com.hughes.sdg.avro.types.NameValueParameter\"}],\"default\":null}]}}],\"default\":null}]}");
  public static org.apache.avro.Schema getClassSchema() { return SCHEMA$; }

  private static SpecificData MODEL$ = new SpecificData();

  private static final BinaryMessageEncoder<OrderedOfferDetails> ENCODER =
      new BinaryMessageEncoder<OrderedOfferDetails>(MODEL$, SCHEMA$);

  private static final BinaryMessageDecoder<OrderedOfferDetails> DECODER =
      new BinaryMessageDecoder<OrderedOfferDetails>(MODEL$, SCHEMA$);

  /**
   * Return the BinaryMessageDecoder instance used by this class.
   */
  public static BinaryMessageDecoder<OrderedOfferDetails> getDecoder() {
    return DECODER;
  }

  /**
   * Create a new BinaryMessageDecoder instance for this class that uses the specified {@link SchemaStore}.
   * @param resolver a {@link SchemaStore} used to find schemas by fingerprint
   */
  public static BinaryMessageDecoder<OrderedOfferDetails> createDecoder(SchemaStore resolver) {
    return new BinaryMessageDecoder<OrderedOfferDetails>(MODEL$, SCHEMA$, resolver);
  }

  /** Serializes this OrderedOfferDetails to a ByteBuffer. */
  public java.nio.ByteBuffer toByteBuffer() throws java.io.IOException {
    return ENCODER.encode(this);
  }

  /** Deserializes a OrderedOfferDetails from a ByteBuffer. */
  public static OrderedOfferDetails fromByteBuffer(
      java.nio.ByteBuffer b) throws java.io.IOException {
    return DECODER.decode(b);
  }

  @Deprecated public java.lang.CharSequence OfferName;
  @Deprecated public java.lang.CharSequence ProgramId;
  @Deprecated public java.lang.CharSequence PackageId;
  @Deprecated public java.lang.CharSequence ProgramCd;
  @Deprecated public java.lang.CharSequence ProgramNm;
  @Deprecated public java.lang.CharSequence PackageNm;
  @Deprecated public java.util.List<com.hughes.sdg.avro.Subscription> Subscriptions;

  /**
   * Default constructor.  Note that this does not initialize fields
   * to their default values from the schema.  If that is desired then
   * one should use <code>newBuilder()</code>.
   */
  public OrderedOfferDetails() {}

  /**
   * All-args constructor.
   * @param OfferName The new value for OfferName
   * @param ProgramId The new value for ProgramId
   * @param PackageId The new value for PackageId
   * @param ProgramCd The new value for ProgramCd
   * @param ProgramNm The new value for ProgramNm
   * @param PackageNm The new value for PackageNm
   * @param Subscriptions The new value for Subscriptions
   */
  public OrderedOfferDetails(java.lang.CharSequence OfferName, java.lang.CharSequence ProgramId, java.lang.CharSequence PackageId, java.lang.CharSequence ProgramCd, java.lang.CharSequence ProgramNm, java.lang.CharSequence PackageNm, java.util.List<com.hughes.sdg.avro.Subscription> Subscriptions) {
    this.OfferName = OfferName;
    this.ProgramId = ProgramId;
    this.PackageId = PackageId;
    this.ProgramCd = ProgramCd;
    this.ProgramNm = ProgramNm;
    this.PackageNm = PackageNm;
    this.Subscriptions = Subscriptions;
  }

  public org.apache.avro.Schema getSchema() { return SCHEMA$; }
  // Used by DatumWriter.  Applications should not call.
  public java.lang.Object get(int field$) {
    switch (field$) {
    case 0: return OfferName;
    case 1: return ProgramId;
    case 2: return PackageId;
    case 3: return ProgramCd;
    case 4: return ProgramNm;
    case 5: return PackageNm;
    case 6: return Subscriptions;
    default: throw new org.apache.avro.AvroRuntimeException("Bad index");
    }
  }

  // Used by DatumReader.  Applications should not call.
  @SuppressWarnings(value="unchecked")
  public void put(int field$, java.lang.Object value$) {
    switch (field$) {
    case 0: OfferName = (java.lang.CharSequence)value$; break;
    case 1: ProgramId = (java.lang.CharSequence)value$; break;
    case 2: PackageId = (java.lang.CharSequence)value$; break;
    case 3: ProgramCd = (java.lang.CharSequence)value$; break;
    case 4: ProgramNm = (java.lang.CharSequence)value$; break;
    case 5: PackageNm = (java.lang.CharSequence)value$; break;
    case 6: Subscriptions = (java.util.List<com.hughes.sdg.avro.Subscription>)value$; break;
    default: throw new org.apache.avro.AvroRuntimeException("Bad index");
    }
  }

  /**
   * Gets the value of the 'OfferName' field.
   * @return The value of the 'OfferName' field.
   */
  public java.lang.CharSequence getOfferName() {
    return OfferName;
  }

  /**
   * Sets the value of the 'OfferName' field.
   * @param value the value to set.
   */
  public void setOfferName(java.lang.CharSequence value) {
    this.OfferName = value;
  }

  /**
   * Gets the value of the 'ProgramId' field.
   * @return The value of the 'ProgramId' field.
   */
  public java.lang.CharSequence getProgramId() {
    return ProgramId;
  }

  /**
   * Sets the value of the 'ProgramId' field.
   * @param value the value to set.
   */
  public void setProgramId(java.lang.CharSequence value) {
    this.ProgramId = value;
  }

  /**
   * Gets the value of the 'PackageId' field.
   * @return The value of the 'PackageId' field.
   */
  public java.lang.CharSequence getPackageId() {
    return PackageId;
  }

  /**
   * Sets the value of the 'PackageId' field.
   * @param value the value to set.
   */
  public void setPackageId(java.lang.CharSequence value) {
    this.PackageId = value;
  }

  /**
   * Gets the value of the 'ProgramCd' field.
   * @return The value of the 'ProgramCd' field.
   */
  public java.lang.CharSequence getProgramCd() {
    return ProgramCd;
  }

  /**
   * Sets the value of the 'ProgramCd' field.
   * @param value the value to set.
   */
  public void setProgramCd(java.lang.CharSequence value) {
    this.ProgramCd = value;
  }

  /**
   * Gets the value of the 'ProgramNm' field.
   * @return The value of the 'ProgramNm' field.
   */
  public java.lang.CharSequence getProgramNm() {
    return ProgramNm;
  }

  /**
   * Sets the value of the 'ProgramNm' field.
   * @param value the value to set.
   */
  public void setProgramNm(java.lang.CharSequence value) {
    this.ProgramNm = value;
  }

  /**
   * Gets the value of the 'PackageNm' field.
   * @return The value of the 'PackageNm' field.
   */
  public java.lang.CharSequence getPackageNm() {
    return PackageNm;
  }

  /**
   * Sets the value of the 'PackageNm' field.
   * @param value the value to set.
   */
  public void setPackageNm(java.lang.CharSequence value) {
    this.PackageNm = value;
  }

  /**
   * Gets the value of the 'Subscriptions' field.
   * @return The value of the 'Subscriptions' field.
   */
  public java.util.List<com.hughes.sdg.avro.Subscription> getSubscriptions() {
    return Subscriptions;
  }

  /**
   * Sets the value of the 'Subscriptions' field.
   * @param value the value to set.
   */
  public void setSubscriptions(java.util.List<com.hughes.sdg.avro.Subscription> value) {
    this.Subscriptions = value;
  }

  /**
   * Creates a new OrderedOfferDetails RecordBuilder.
   * @return A new OrderedOfferDetails RecordBuilder
   */
  public static com.hughes.sdg.avro.OrderedOfferDetails.Builder newBuilder() {
    return new com.hughes.sdg.avro.OrderedOfferDetails.Builder();
  }

  /**
   * Creates a new OrderedOfferDetails RecordBuilder by copying an existing Builder.
   * @param other The existing builder to copy.
   * @return A new OrderedOfferDetails RecordBuilder
   */
  public static com.hughes.sdg.avro.OrderedOfferDetails.Builder newBuilder(com.hughes.sdg.avro.OrderedOfferDetails.Builder other) {
    return new com.hughes.sdg.avro.OrderedOfferDetails.Builder(other);
  }

  /**
   * Creates a new OrderedOfferDetails RecordBuilder by copying an existing OrderedOfferDetails instance.
   * @param other The existing instance to copy.
   * @return A new OrderedOfferDetails RecordBuilder
   */
  public static com.hughes.sdg.avro.OrderedOfferDetails.Builder newBuilder(com.hughes.sdg.avro.OrderedOfferDetails other) {
    return new com.hughes.sdg.avro.OrderedOfferDetails.Builder(other);
  }

  /**
   * RecordBuilder for OrderedOfferDetails instances.
   */
  public static class Builder extends org.apache.avro.specific.SpecificRecordBuilderBase<OrderedOfferDetails>
    implements org.apache.avro.data.RecordBuilder<OrderedOfferDetails> {

    private java.lang.CharSequence OfferName;
    private java.lang.CharSequence ProgramId;
    private java.lang.CharSequence PackageId;
    private java.lang.CharSequence ProgramCd;
    private java.lang.CharSequence ProgramNm;
    private java.lang.CharSequence PackageNm;
    private java.util.List<com.hughes.sdg.avro.Subscription> Subscriptions;

    /** Creates a new Builder */
    private Builder() {
      super(SCHEMA$);
    }

    /**
     * Creates a Builder by copying an existing Builder.
     * @param other The existing Builder to copy.
     */
    private Builder(com.hughes.sdg.avro.OrderedOfferDetails.Builder other) {
      super(other);
      if (isValidValue(fields()[0], other.OfferName)) {
        this.OfferName = data().deepCopy(fields()[0].schema(), other.OfferName);
        fieldSetFlags()[0] = true;
      }
      if (isValidValue(fields()[1], other.ProgramId)) {
        this.ProgramId = data().deepCopy(fields()[1].schema(), other.ProgramId);
        fieldSetFlags()[1] = true;
      }
      if (isValidValue(fields()[2], other.PackageId)) {
        this.PackageId = data().deepCopy(fields()[2].schema(), other.PackageId);
        fieldSetFlags()[2] = true;
      }
      if (isValidValue(fields()[3], other.ProgramCd)) {
        this.ProgramCd = data().deepCopy(fields()[3].schema(), other.ProgramCd);
        fieldSetFlags()[3] = true;
      }
      if (isValidValue(fields()[4], other.ProgramNm)) {
        this.ProgramNm = data().deepCopy(fields()[4].schema(), other.ProgramNm);
        fieldSetFlags()[4] = true;
      }
      if (isValidValue(fields()[5], other.PackageNm)) {
        this.PackageNm = data().deepCopy(fields()[5].schema(), other.PackageNm);
        fieldSetFlags()[5] = true;
      }
      if (isValidValue(fields()[6], other.Subscriptions)) {
        this.Subscriptions = data().deepCopy(fields()[6].schema(), other.Subscriptions);
        fieldSetFlags()[6] = true;
      }
    }

    /**
     * Creates a Builder by copying an existing OrderedOfferDetails instance
     * @param other The existing instance to copy.
     */
    private Builder(com.hughes.sdg.avro.OrderedOfferDetails other) {
            super(SCHEMA$);
      if (isValidValue(fields()[0], other.OfferName)) {
        this.OfferName = data().deepCopy(fields()[0].schema(), other.OfferName);
        fieldSetFlags()[0] = true;
      }
      if (isValidValue(fields()[1], other.ProgramId)) {
        this.ProgramId = data().deepCopy(fields()[1].schema(), other.ProgramId);
        fieldSetFlags()[1] = true;
      }
      if (isValidValue(fields()[2], other.PackageId)) {
        this.PackageId = data().deepCopy(fields()[2].schema(), other.PackageId);
        fieldSetFlags()[2] = true;
      }
      if (isValidValue(fields()[3], other.ProgramCd)) {
        this.ProgramCd = data().deepCopy(fields()[3].schema(), other.ProgramCd);
        fieldSetFlags()[3] = true;
      }
      if (isValidValue(fields()[4], other.ProgramNm)) {
        this.ProgramNm = data().deepCopy(fields()[4].schema(), other.ProgramNm);
        fieldSetFlags()[4] = true;
      }
      if (isValidValue(fields()[5], other.PackageNm)) {
        this.PackageNm = data().deepCopy(fields()[5].schema(), other.PackageNm);
        fieldSetFlags()[5] = true;
      }
      if (isValidValue(fields()[6], other.Subscriptions)) {
        this.Subscriptions = data().deepCopy(fields()[6].schema(), other.Subscriptions);
        fieldSetFlags()[6] = true;
      }
    }

    /**
      * Gets the value of the 'OfferName' field.
      * @return The value.
      */
    public java.lang.CharSequence getOfferName() {
      return OfferName;
    }

    /**
      * Sets the value of the 'OfferName' field.
      * @param value The value of 'OfferName'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.OrderedOfferDetails.Builder setOfferName(java.lang.CharSequence value) {
      validate(fields()[0], value);
      this.OfferName = value;
      fieldSetFlags()[0] = true;
      return this;
    }

    /**
      * Checks whether the 'OfferName' field has been set.
      * @return True if the 'OfferName' field has been set, false otherwise.
      */
    public boolean hasOfferName() {
      return fieldSetFlags()[0];
    }


    /**
      * Clears the value of the 'OfferName' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.OrderedOfferDetails.Builder clearOfferName() {
      OfferName = null;
      fieldSetFlags()[0] = false;
      return this;
    }

    /**
      * Gets the value of the 'ProgramId' field.
      * @return The value.
      */
    public java.lang.CharSequence getProgramId() {
      return ProgramId;
    }

    /**
      * Sets the value of the 'ProgramId' field.
      * @param value The value of 'ProgramId'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.OrderedOfferDetails.Builder setProgramId(java.lang.CharSequence value) {
      validate(fields()[1], value);
      this.ProgramId = value;
      fieldSetFlags()[1] = true;
      return this;
    }

    /**
      * Checks whether the 'ProgramId' field has been set.
      * @return True if the 'ProgramId' field has been set, false otherwise.
      */
    public boolean hasProgramId() {
      return fieldSetFlags()[1];
    }


    /**
      * Clears the value of the 'ProgramId' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.OrderedOfferDetails.Builder clearProgramId() {
      ProgramId = null;
      fieldSetFlags()[1] = false;
      return this;
    }

    /**
      * Gets the value of the 'PackageId' field.
      * @return The value.
      */
    public java.lang.CharSequence getPackageId() {
      return PackageId;
    }

    /**
      * Sets the value of the 'PackageId' field.
      * @param value The value of 'PackageId'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.OrderedOfferDetails.Builder setPackageId(java.lang.CharSequence value) {
      validate(fields()[2], value);
      this.PackageId = value;
      fieldSetFlags()[2] = true;
      return this;
    }

    /**
      * Checks whether the 'PackageId' field has been set.
      * @return True if the 'PackageId' field has been set, false otherwise.
      */
    public boolean hasPackageId() {
      return fieldSetFlags()[2];
    }


    /**
      * Clears the value of the 'PackageId' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.OrderedOfferDetails.Builder clearPackageId() {
      PackageId = null;
      fieldSetFlags()[2] = false;
      return this;
    }

    /**
      * Gets the value of the 'ProgramCd' field.
      * @return The value.
      */
    public java.lang.CharSequence getProgramCd() {
      return ProgramCd;
    }

    /**
      * Sets the value of the 'ProgramCd' field.
      * @param value The value of 'ProgramCd'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.OrderedOfferDetails.Builder setProgramCd(java.lang.CharSequence value) {
      validate(fields()[3], value);
      this.ProgramCd = value;
      fieldSetFlags()[3] = true;
      return this;
    }

    /**
      * Checks whether the 'ProgramCd' field has been set.
      * @return True if the 'ProgramCd' field has been set, false otherwise.
      */
    public boolean hasProgramCd() {
      return fieldSetFlags()[3];
    }


    /**
      * Clears the value of the 'ProgramCd' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.OrderedOfferDetails.Builder clearProgramCd() {
      ProgramCd = null;
      fieldSetFlags()[3] = false;
      return this;
    }

    /**
      * Gets the value of the 'ProgramNm' field.
      * @return The value.
      */
    public java.lang.CharSequence getProgramNm() {
      return ProgramNm;
    }

    /**
      * Sets the value of the 'ProgramNm' field.
      * @param value The value of 'ProgramNm'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.OrderedOfferDetails.Builder setProgramNm(java.lang.CharSequence value) {
      validate(fields()[4], value);
      this.ProgramNm = value;
      fieldSetFlags()[4] = true;
      return this;
    }

    /**
      * Checks whether the 'ProgramNm' field has been set.
      * @return True if the 'ProgramNm' field has been set, false otherwise.
      */
    public boolean hasProgramNm() {
      return fieldSetFlags()[4];
    }


    /**
      * Clears the value of the 'ProgramNm' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.OrderedOfferDetails.Builder clearProgramNm() {
      ProgramNm = null;
      fieldSetFlags()[4] = false;
      return this;
    }

    /**
      * Gets the value of the 'PackageNm' field.
      * @return The value.
      */
    public java.lang.CharSequence getPackageNm() {
      return PackageNm;
    }

    /**
      * Sets the value of the 'PackageNm' field.
      * @param value The value of 'PackageNm'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.OrderedOfferDetails.Builder setPackageNm(java.lang.CharSequence value) {
      validate(fields()[5], value);
      this.PackageNm = value;
      fieldSetFlags()[5] = true;
      return this;
    }

    /**
      * Checks whether the 'PackageNm' field has been set.
      * @return True if the 'PackageNm' field has been set, false otherwise.
      */
    public boolean hasPackageNm() {
      return fieldSetFlags()[5];
    }


    /**
      * Clears the value of the 'PackageNm' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.OrderedOfferDetails.Builder clearPackageNm() {
      PackageNm = null;
      fieldSetFlags()[5] = false;
      return this;
    }

    /**
      * Gets the value of the 'Subscriptions' field.
      * @return The value.
      */
    public java.util.List<com.hughes.sdg.avro.Subscription> getSubscriptions() {
      return Subscriptions;
    }

    /**
      * Sets the value of the 'Subscriptions' field.
      * @param value The value of 'Subscriptions'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.OrderedOfferDetails.Builder setSubscriptions(java.util.List<com.hughes.sdg.avro.Subscription> value) {
      validate(fields()[6], value);
      this.Subscriptions = value;
      fieldSetFlags()[6] = true;
      return this;
    }

    /**
      * Checks whether the 'Subscriptions' field has been set.
      * @return True if the 'Subscriptions' field has been set, false otherwise.
      */
    public boolean hasSubscriptions() {
      return fieldSetFlags()[6];
    }


    /**
      * Clears the value of the 'Subscriptions' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.OrderedOfferDetails.Builder clearSubscriptions() {
      Subscriptions = null;
      fieldSetFlags()[6] = false;
      return this;
    }

    @Override
    @SuppressWarnings("unchecked")
    public OrderedOfferDetails build() {
      try {
        OrderedOfferDetails record = new OrderedOfferDetails();
        record.OfferName = fieldSetFlags()[0] ? this.OfferName : (java.lang.CharSequence) defaultValue(fields()[0]);
        record.ProgramId = fieldSetFlags()[1] ? this.ProgramId : (java.lang.CharSequence) defaultValue(fields()[1]);
        record.PackageId = fieldSetFlags()[2] ? this.PackageId : (java.lang.CharSequence) defaultValue(fields()[2]);
        record.ProgramCd = fieldSetFlags()[3] ? this.ProgramCd : (java.lang.CharSequence) defaultValue(fields()[3]);
        record.ProgramNm = fieldSetFlags()[4] ? this.ProgramNm : (java.lang.CharSequence) defaultValue(fields()[4]);
        record.PackageNm = fieldSetFlags()[5] ? this.PackageNm : (java.lang.CharSequence) defaultValue(fields()[5]);
        record.Subscriptions = fieldSetFlags()[6] ? this.Subscriptions : (java.util.List<com.hughes.sdg.avro.Subscription>) defaultValue(fields()[6]);
        return record;
      } catch (java.lang.Exception e) {
        throw new org.apache.avro.AvroRuntimeException(e);
      }
    }
  }

  @SuppressWarnings("unchecked")
  private static final org.apache.avro.io.DatumWriter<OrderedOfferDetails>
    WRITER$ = (org.apache.avro.io.DatumWriter<OrderedOfferDetails>)MODEL$.createDatumWriter(SCHEMA$);

  @Override public void writeExternal(java.io.ObjectOutput out)
    throws java.io.IOException {
    WRITER$.write(this, SpecificData.getEncoder(out));
  }

  @SuppressWarnings("unchecked")
  private static final org.apache.avro.io.DatumReader<OrderedOfferDetails>
    READER$ = (org.apache.avro.io.DatumReader<OrderedOfferDetails>)MODEL$.createDatumReader(SCHEMA$);

  @Override public void readExternal(java.io.ObjectInput in)
    throws java.io.IOException {
    READER$.read(this, SpecificData.getDecoder(in));
  }

}
