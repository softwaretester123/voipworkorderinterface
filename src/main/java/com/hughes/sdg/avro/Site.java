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
public class Site extends org.apache.avro.specific.SpecificRecordBase implements org.apache.avro.specific.SpecificRecord {
  private static final long serialVersionUID = -4398470122492977991L;
  public static final org.apache.avro.Schema SCHEMA$ = new org.apache.avro.Schema.Parser().parse("{\"type\":\"record\",\"name\":\"Site\",\"namespace\":\"com.hughes.sdg.avro\",\"fields\":[{\"name\":\"SiteInformation\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"SiteInformation\",\"fields\":[{\"name\":\"SiteId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"SAN\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"SiteType\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ClassA\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ClassB\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ProductId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"BusinessModel\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"Email\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"SiteStatusCd\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ProvisioningDt\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"InstallDt\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"CreateDt\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ModifyDt\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"CancelDt\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ServiceList\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"string\"}],\"default\":null}]}],\"default\":null},{\"name\":\"SiteName\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"PersonName\",\"namespace\":\"com.hughes.sdg.avro.types\",\"fields\":[{\"name\":\"FirstName\",\"type\":\"string\"},{\"name\":\"MiddleName\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"LastName\",\"type\":\"string\"}]}],\"default\":null},{\"name\":\"SiteAddress\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"Address\",\"namespace\":\"com.hughes.sdg.avro.types\",\"fields\":[{\"name\":\"Address1\",\"type\":\"string\"},{\"name\":\"Address2\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"City\",\"type\":\"string\"},{\"name\":\"State\",\"type\":\"string\"},{\"name\":\"Zip\",\"type\":\"string\"},{\"name\":\"Country\",\"type\":\"string\"},{\"name\":\"Latitude\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"Longitude\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"USPSBarCodeNumber\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"DPVCode\",\"type\":[\"null\",\"string\"],\"default\":null}]}],\"default\":null},{\"name\":\"SitePhone\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"Phone\",\"namespace\":\"com.hughes.sdg.avro.types\",\"fields\":[{\"name\":\"Number\",\"type\":\"string\"},{\"name\":\"Type\",\"type\":\"string\"},{\"name\":\"Use\",\"type\":[\"null\",\"string\"],\"default\":null}]}],\"default\":null},{\"name\":\"LocationParameters\",\"type\":[\"null\",{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"NameValueParameter\",\"namespace\":\"com.hughes.sdg.avro.types\",\"fields\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"value\",\"type\":\"string\"}]}}],\"default\":null},{\"name\":\"SiteAttributes\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"com.hughes.sdg.avro.types.NameValueParameter\"}],\"default\":null},{\"name\":\"NetworkParameters\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"com.hughes.sdg.avro.types.NameValueParameter\"}],\"default\":null}]}");
  public static org.apache.avro.Schema getClassSchema() { return SCHEMA$; }

  private static SpecificData MODEL$ = new SpecificData();

  private static final BinaryMessageEncoder<Site> ENCODER =
      new BinaryMessageEncoder<Site>(MODEL$, SCHEMA$);

  private static final BinaryMessageDecoder<Site> DECODER =
      new BinaryMessageDecoder<Site>(MODEL$, SCHEMA$);

  /**
   * Return the BinaryMessageDecoder instance used by this class.
   */
  public static BinaryMessageDecoder<Site> getDecoder() {
    return DECODER;
  }

  /**
   * Create a new BinaryMessageDecoder instance for this class that uses the specified {@link SchemaStore}.
   * @param resolver a {@link SchemaStore} used to find schemas by fingerprint
   */
  public static BinaryMessageDecoder<Site> createDecoder(SchemaStore resolver) {
    return new BinaryMessageDecoder<Site>(MODEL$, SCHEMA$, resolver);
  }

  /** Serializes this Site to a ByteBuffer. */
  public java.nio.ByteBuffer toByteBuffer() throws java.io.IOException {
    return ENCODER.encode(this);
  }

  /** Deserializes a Site from a ByteBuffer. */
  public static Site fromByteBuffer(
      java.nio.ByteBuffer b) throws java.io.IOException {
    return DECODER.decode(b);
  }

  @Deprecated public com.hughes.sdg.avro.SiteInformation SiteInformation;
  @Deprecated public com.hughes.sdg.avro.types.PersonName SiteName;
  @Deprecated public com.hughes.sdg.avro.types.Address SiteAddress;
  @Deprecated public com.hughes.sdg.avro.types.Phone SitePhone;
  @Deprecated public java.util.List<com.hughes.sdg.avro.types.NameValueParameter> LocationParameters;
  @Deprecated public java.util.List<com.hughes.sdg.avro.types.NameValueParameter> SiteAttributes;
  @Deprecated public java.util.List<com.hughes.sdg.avro.types.NameValueParameter> NetworkParameters;

  /**
   * Default constructor.  Note that this does not initialize fields
   * to their default values from the schema.  If that is desired then
   * one should use <code>newBuilder()</code>.
   */
  public Site() {}

  /**
   * All-args constructor.
   * @param SiteInformation The new value for SiteInformation
   * @param SiteName The new value for SiteName
   * @param SiteAddress The new value for SiteAddress
   * @param SitePhone The new value for SitePhone
   * @param LocationParameters The new value for LocationParameters
   * @param SiteAttributes The new value for SiteAttributes
   * @param NetworkParameters The new value for NetworkParameters
   */
  public Site(com.hughes.sdg.avro.SiteInformation SiteInformation, com.hughes.sdg.avro.types.PersonName SiteName, com.hughes.sdg.avro.types.Address SiteAddress, com.hughes.sdg.avro.types.Phone SitePhone, java.util.List<com.hughes.sdg.avro.types.NameValueParameter> LocationParameters, java.util.List<com.hughes.sdg.avro.types.NameValueParameter> SiteAttributes, java.util.List<com.hughes.sdg.avro.types.NameValueParameter> NetworkParameters) {
    this.SiteInformation = SiteInformation;
    this.SiteName = SiteName;
    this.SiteAddress = SiteAddress;
    this.SitePhone = SitePhone;
    this.LocationParameters = LocationParameters;
    this.SiteAttributes = SiteAttributes;
    this.NetworkParameters = NetworkParameters;
  }

  public org.apache.avro.Schema getSchema() { return SCHEMA$; }
  // Used by DatumWriter.  Applications should not call.
  public java.lang.Object get(int field$) {
    switch (field$) {
    case 0: return SiteInformation;
    case 1: return SiteName;
    case 2: return SiteAddress;
    case 3: return SitePhone;
    case 4: return LocationParameters;
    case 5: return SiteAttributes;
    case 6: return NetworkParameters;
    default: throw new org.apache.avro.AvroRuntimeException("Bad index");
    }
  }

  // Used by DatumReader.  Applications should not call.
  @SuppressWarnings(value="unchecked")
  public void put(int field$, java.lang.Object value$) {
    switch (field$) {
    case 0: SiteInformation = (com.hughes.sdg.avro.SiteInformation)value$; break;
    case 1: SiteName = (com.hughes.sdg.avro.types.PersonName)value$; break;
    case 2: SiteAddress = (com.hughes.sdg.avro.types.Address)value$; break;
    case 3: SitePhone = (com.hughes.sdg.avro.types.Phone)value$; break;
    case 4: LocationParameters = (java.util.List<com.hughes.sdg.avro.types.NameValueParameter>)value$; break;
    case 5: SiteAttributes = (java.util.List<com.hughes.sdg.avro.types.NameValueParameter>)value$; break;
    case 6: NetworkParameters = (java.util.List<com.hughes.sdg.avro.types.NameValueParameter>)value$; break;
    default: throw new org.apache.avro.AvroRuntimeException("Bad index");
    }
  }

  /**
   * Gets the value of the 'SiteInformation' field.
   * @return The value of the 'SiteInformation' field.
   */
  public com.hughes.sdg.avro.SiteInformation getSiteInformation() {
    return SiteInformation;
  }

  /**
   * Sets the value of the 'SiteInformation' field.
   * @param value the value to set.
   */
  public void setSiteInformation(com.hughes.sdg.avro.SiteInformation value) {
    this.SiteInformation = value;
  }

  /**
   * Gets the value of the 'SiteName' field.
   * @return The value of the 'SiteName' field.
   */
  public com.hughes.sdg.avro.types.PersonName getSiteName() {
    return SiteName;
  }

  /**
   * Sets the value of the 'SiteName' field.
   * @param value the value to set.
   */
  public void setSiteName(com.hughes.sdg.avro.types.PersonName value) {
    this.SiteName = value;
  }

  /**
   * Gets the value of the 'SiteAddress' field.
   * @return The value of the 'SiteAddress' field.
   */
  public com.hughes.sdg.avro.types.Address getSiteAddress() {
    return SiteAddress;
  }

  /**
   * Sets the value of the 'SiteAddress' field.
   * @param value the value to set.
   */
  public void setSiteAddress(com.hughes.sdg.avro.types.Address value) {
    this.SiteAddress = value;
  }

  /**
   * Gets the value of the 'SitePhone' field.
   * @return The value of the 'SitePhone' field.
   */
  public com.hughes.sdg.avro.types.Phone getSitePhone() {
    return SitePhone;
  }

  /**
   * Sets the value of the 'SitePhone' field.
   * @param value the value to set.
   */
  public void setSitePhone(com.hughes.sdg.avro.types.Phone value) {
    this.SitePhone = value;
  }

  /**
   * Gets the value of the 'LocationParameters' field.
   * @return The value of the 'LocationParameters' field.
   */
  public java.util.List<com.hughes.sdg.avro.types.NameValueParameter> getLocationParameters() {
    return LocationParameters;
  }

  /**
   * Sets the value of the 'LocationParameters' field.
   * @param value the value to set.
   */
  public void setLocationParameters(java.util.List<com.hughes.sdg.avro.types.NameValueParameter> value) {
    this.LocationParameters = value;
  }

  /**
   * Gets the value of the 'SiteAttributes' field.
   * @return The value of the 'SiteAttributes' field.
   */
  public java.util.List<com.hughes.sdg.avro.types.NameValueParameter> getSiteAttributes() {
    return SiteAttributes;
  }

  /**
   * Sets the value of the 'SiteAttributes' field.
   * @param value the value to set.
   */
  public void setSiteAttributes(java.util.List<com.hughes.sdg.avro.types.NameValueParameter> value) {
    this.SiteAttributes = value;
  }

  /**
   * Gets the value of the 'NetworkParameters' field.
   * @return The value of the 'NetworkParameters' field.
   */
  public java.util.List<com.hughes.sdg.avro.types.NameValueParameter> getNetworkParameters() {
    return NetworkParameters;
  }

  /**
   * Sets the value of the 'NetworkParameters' field.
   * @param value the value to set.
   */
  public void setNetworkParameters(java.util.List<com.hughes.sdg.avro.types.NameValueParameter> value) {
    this.NetworkParameters = value;
  }

  /**
   * Creates a new Site RecordBuilder.
   * @return A new Site RecordBuilder
   */
  public static com.hughes.sdg.avro.Site.Builder newBuilder() {
    return new com.hughes.sdg.avro.Site.Builder();
  }

  /**
   * Creates a new Site RecordBuilder by copying an existing Builder.
   * @param other The existing builder to copy.
   * @return A new Site RecordBuilder
   */
  public static com.hughes.sdg.avro.Site.Builder newBuilder(com.hughes.sdg.avro.Site.Builder other) {
    return new com.hughes.sdg.avro.Site.Builder(other);
  }

  /**
   * Creates a new Site RecordBuilder by copying an existing Site instance.
   * @param other The existing instance to copy.
   * @return A new Site RecordBuilder
   */
  public static com.hughes.sdg.avro.Site.Builder newBuilder(com.hughes.sdg.avro.Site other) {
    return new com.hughes.sdg.avro.Site.Builder(other);
  }

  /**
   * RecordBuilder for Site instances.
   */
  public static class Builder extends org.apache.avro.specific.SpecificRecordBuilderBase<Site>
    implements org.apache.avro.data.RecordBuilder<Site> {

    private com.hughes.sdg.avro.SiteInformation SiteInformation;
    private com.hughes.sdg.avro.SiteInformation.Builder SiteInformationBuilder;
    private com.hughes.sdg.avro.types.PersonName SiteName;
    private com.hughes.sdg.avro.types.PersonName.Builder SiteNameBuilder;
    private com.hughes.sdg.avro.types.Address SiteAddress;
    private com.hughes.sdg.avro.types.Address.Builder SiteAddressBuilder;
    private com.hughes.sdg.avro.types.Phone SitePhone;
    private com.hughes.sdg.avro.types.Phone.Builder SitePhoneBuilder;
    private java.util.List<com.hughes.sdg.avro.types.NameValueParameter> LocationParameters;
    private java.util.List<com.hughes.sdg.avro.types.NameValueParameter> SiteAttributes;
    private java.util.List<com.hughes.sdg.avro.types.NameValueParameter> NetworkParameters;

    /** Creates a new Builder */
    private Builder() {
      super(SCHEMA$);
    }

    /**
     * Creates a Builder by copying an existing Builder.
     * @param other The existing Builder to copy.
     */
    private Builder(com.hughes.sdg.avro.Site.Builder other) {
      super(other);
      if (isValidValue(fields()[0], other.SiteInformation)) {
        this.SiteInformation = data().deepCopy(fields()[0].schema(), other.SiteInformation);
        fieldSetFlags()[0] = true;
      }
      if (other.hasSiteInformationBuilder()) {
        this.SiteInformationBuilder = com.hughes.sdg.avro.SiteInformation.newBuilder(other.getSiteInformationBuilder());
      }
      if (isValidValue(fields()[1], other.SiteName)) {
        this.SiteName = data().deepCopy(fields()[1].schema(), other.SiteName);
        fieldSetFlags()[1] = true;
      }
      if (other.hasSiteNameBuilder()) {
        this.SiteNameBuilder = com.hughes.sdg.avro.types.PersonName.newBuilder(other.getSiteNameBuilder());
      }
      if (isValidValue(fields()[2], other.SiteAddress)) {
        this.SiteAddress = data().deepCopy(fields()[2].schema(), other.SiteAddress);
        fieldSetFlags()[2] = true;
      }
      if (other.hasSiteAddressBuilder()) {
        this.SiteAddressBuilder = com.hughes.sdg.avro.types.Address.newBuilder(other.getSiteAddressBuilder());
      }
      if (isValidValue(fields()[3], other.SitePhone)) {
        this.SitePhone = data().deepCopy(fields()[3].schema(), other.SitePhone);
        fieldSetFlags()[3] = true;
      }
      if (other.hasSitePhoneBuilder()) {
        this.SitePhoneBuilder = com.hughes.sdg.avro.types.Phone.newBuilder(other.getSitePhoneBuilder());
      }
      if (isValidValue(fields()[4], other.LocationParameters)) {
        this.LocationParameters = data().deepCopy(fields()[4].schema(), other.LocationParameters);
        fieldSetFlags()[4] = true;
      }
      if (isValidValue(fields()[5], other.SiteAttributes)) {
        this.SiteAttributes = data().deepCopy(fields()[5].schema(), other.SiteAttributes);
        fieldSetFlags()[5] = true;
      }
      if (isValidValue(fields()[6], other.NetworkParameters)) {
        this.NetworkParameters = data().deepCopy(fields()[6].schema(), other.NetworkParameters);
        fieldSetFlags()[6] = true;
      }
    }

    /**
     * Creates a Builder by copying an existing Site instance
     * @param other The existing instance to copy.
     */
    private Builder(com.hughes.sdg.avro.Site other) {
            super(SCHEMA$);
      if (isValidValue(fields()[0], other.SiteInformation)) {
        this.SiteInformation = data().deepCopy(fields()[0].schema(), other.SiteInformation);
        fieldSetFlags()[0] = true;
      }
      this.SiteInformationBuilder = null;
      if (isValidValue(fields()[1], other.SiteName)) {
        this.SiteName = data().deepCopy(fields()[1].schema(), other.SiteName);
        fieldSetFlags()[1] = true;
      }
      this.SiteNameBuilder = null;
      if (isValidValue(fields()[2], other.SiteAddress)) {
        this.SiteAddress = data().deepCopy(fields()[2].schema(), other.SiteAddress);
        fieldSetFlags()[2] = true;
      }
      this.SiteAddressBuilder = null;
      if (isValidValue(fields()[3], other.SitePhone)) {
        this.SitePhone = data().deepCopy(fields()[3].schema(), other.SitePhone);
        fieldSetFlags()[3] = true;
      }
      this.SitePhoneBuilder = null;
      if (isValidValue(fields()[4], other.LocationParameters)) {
        this.LocationParameters = data().deepCopy(fields()[4].schema(), other.LocationParameters);
        fieldSetFlags()[4] = true;
      }
      if (isValidValue(fields()[5], other.SiteAttributes)) {
        this.SiteAttributes = data().deepCopy(fields()[5].schema(), other.SiteAttributes);
        fieldSetFlags()[5] = true;
      }
      if (isValidValue(fields()[6], other.NetworkParameters)) {
        this.NetworkParameters = data().deepCopy(fields()[6].schema(), other.NetworkParameters);
        fieldSetFlags()[6] = true;
      }
    }

    /**
      * Gets the value of the 'SiteInformation' field.
      * @return The value.
      */
    public com.hughes.sdg.avro.SiteInformation getSiteInformation() {
      return SiteInformation;
    }

    /**
      * Sets the value of the 'SiteInformation' field.
      * @param value The value of 'SiteInformation'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.Site.Builder setSiteInformation(com.hughes.sdg.avro.SiteInformation value) {
      validate(fields()[0], value);
      this.SiteInformationBuilder = null;
      this.SiteInformation = value;
      fieldSetFlags()[0] = true;
      return this;
    }

    /**
      * Checks whether the 'SiteInformation' field has been set.
      * @return True if the 'SiteInformation' field has been set, false otherwise.
      */
    public boolean hasSiteInformation() {
      return fieldSetFlags()[0];
    }

    /**
     * Gets the Builder instance for the 'SiteInformation' field and creates one if it doesn't exist yet.
     * @return This builder.
     */
    public com.hughes.sdg.avro.SiteInformation.Builder getSiteInformationBuilder() {
      if (SiteInformationBuilder == null) {
        if (hasSiteInformation()) {
          setSiteInformationBuilder(com.hughes.sdg.avro.SiteInformation.newBuilder(SiteInformation));
        } else {
          setSiteInformationBuilder(com.hughes.sdg.avro.SiteInformation.newBuilder());
        }
      }
      return SiteInformationBuilder;
    }

    /**
     * Sets the Builder instance for the 'SiteInformation' field
     * @param value The builder instance that must be set.
     * @return This builder.
     */
    public com.hughes.sdg.avro.Site.Builder setSiteInformationBuilder(com.hughes.sdg.avro.SiteInformation.Builder value) {
      clearSiteInformation();
      SiteInformationBuilder = value;
      return this;
    }

    /**
     * Checks whether the 'SiteInformation' field has an active Builder instance
     * @return True if the 'SiteInformation' field has an active Builder instance
     */
    public boolean hasSiteInformationBuilder() {
      return SiteInformationBuilder != null;
    }

    /**
      * Clears the value of the 'SiteInformation' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.Site.Builder clearSiteInformation() {
      SiteInformation = null;
      SiteInformationBuilder = null;
      fieldSetFlags()[0] = false;
      return this;
    }

    /**
      * Gets the value of the 'SiteName' field.
      * @return The value.
      */
    public com.hughes.sdg.avro.types.PersonName getSiteName() {
      return SiteName;
    }

    /**
      * Sets the value of the 'SiteName' field.
      * @param value The value of 'SiteName'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.Site.Builder setSiteName(com.hughes.sdg.avro.types.PersonName value) {
      validate(fields()[1], value);
      this.SiteNameBuilder = null;
      this.SiteName = value;
      fieldSetFlags()[1] = true;
      return this;
    }

    /**
      * Checks whether the 'SiteName' field has been set.
      * @return True if the 'SiteName' field has been set, false otherwise.
      */
    public boolean hasSiteName() {
      return fieldSetFlags()[1];
    }

    /**
     * Gets the Builder instance for the 'SiteName' field and creates one if it doesn't exist yet.
     * @return This builder.
     */
    public com.hughes.sdg.avro.types.PersonName.Builder getSiteNameBuilder() {
      if (SiteNameBuilder == null) {
        if (hasSiteName()) {
          setSiteNameBuilder(com.hughes.sdg.avro.types.PersonName.newBuilder(SiteName));
        } else {
          setSiteNameBuilder(com.hughes.sdg.avro.types.PersonName.newBuilder());
        }
      }
      return SiteNameBuilder;
    }

    /**
     * Sets the Builder instance for the 'SiteName' field
     * @param value The builder instance that must be set.
     * @return This builder.
     */
    public com.hughes.sdg.avro.Site.Builder setSiteNameBuilder(com.hughes.sdg.avro.types.PersonName.Builder value) {
      clearSiteName();
      SiteNameBuilder = value;
      return this;
    }

    /**
     * Checks whether the 'SiteName' field has an active Builder instance
     * @return True if the 'SiteName' field has an active Builder instance
     */
    public boolean hasSiteNameBuilder() {
      return SiteNameBuilder != null;
    }

    /**
      * Clears the value of the 'SiteName' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.Site.Builder clearSiteName() {
      SiteName = null;
      SiteNameBuilder = null;
      fieldSetFlags()[1] = false;
      return this;
    }

    /**
      * Gets the value of the 'SiteAddress' field.
      * @return The value.
      */
    public com.hughes.sdg.avro.types.Address getSiteAddress() {
      return SiteAddress;
    }

    /**
      * Sets the value of the 'SiteAddress' field.
      * @param value The value of 'SiteAddress'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.Site.Builder setSiteAddress(com.hughes.sdg.avro.types.Address value) {
      validate(fields()[2], value);
      this.SiteAddressBuilder = null;
      this.SiteAddress = value;
      fieldSetFlags()[2] = true;
      return this;
    }

    /**
      * Checks whether the 'SiteAddress' field has been set.
      * @return True if the 'SiteAddress' field has been set, false otherwise.
      */
    public boolean hasSiteAddress() {
      return fieldSetFlags()[2];
    }

    /**
     * Gets the Builder instance for the 'SiteAddress' field and creates one if it doesn't exist yet.
     * @return This builder.
     */
    public com.hughes.sdg.avro.types.Address.Builder getSiteAddressBuilder() {
      if (SiteAddressBuilder == null) {
        if (hasSiteAddress()) {
          setSiteAddressBuilder(com.hughes.sdg.avro.types.Address.newBuilder(SiteAddress));
        } else {
          setSiteAddressBuilder(com.hughes.sdg.avro.types.Address.newBuilder());
        }
      }
      return SiteAddressBuilder;
    }

    /**
     * Sets the Builder instance for the 'SiteAddress' field
     * @param value The builder instance that must be set.
     * @return This builder.
     */
    public com.hughes.sdg.avro.Site.Builder setSiteAddressBuilder(com.hughes.sdg.avro.types.Address.Builder value) {
      clearSiteAddress();
      SiteAddressBuilder = value;
      return this;
    }

    /**
     * Checks whether the 'SiteAddress' field has an active Builder instance
     * @return True if the 'SiteAddress' field has an active Builder instance
     */
    public boolean hasSiteAddressBuilder() {
      return SiteAddressBuilder != null;
    }

    /**
      * Clears the value of the 'SiteAddress' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.Site.Builder clearSiteAddress() {
      SiteAddress = null;
      SiteAddressBuilder = null;
      fieldSetFlags()[2] = false;
      return this;
    }

    /**
      * Gets the value of the 'SitePhone' field.
      * @return The value.
      */
    public com.hughes.sdg.avro.types.Phone getSitePhone() {
      return SitePhone;
    }

    /**
      * Sets the value of the 'SitePhone' field.
      * @param value The value of 'SitePhone'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.Site.Builder setSitePhone(com.hughes.sdg.avro.types.Phone value) {
      validate(fields()[3], value);
      this.SitePhoneBuilder = null;
      this.SitePhone = value;
      fieldSetFlags()[3] = true;
      return this;
    }

    /**
      * Checks whether the 'SitePhone' field has been set.
      * @return True if the 'SitePhone' field has been set, false otherwise.
      */
    public boolean hasSitePhone() {
      return fieldSetFlags()[3];
    }

    /**
     * Gets the Builder instance for the 'SitePhone' field and creates one if it doesn't exist yet.
     * @return This builder.
     */
    public com.hughes.sdg.avro.types.Phone.Builder getSitePhoneBuilder() {
      if (SitePhoneBuilder == null) {
        if (hasSitePhone()) {
          setSitePhoneBuilder(com.hughes.sdg.avro.types.Phone.newBuilder(SitePhone));
        } else {
          setSitePhoneBuilder(com.hughes.sdg.avro.types.Phone.newBuilder());
        }
      }
      return SitePhoneBuilder;
    }

    /**
     * Sets the Builder instance for the 'SitePhone' field
     * @param value The builder instance that must be set.
     * @return This builder.
     */
    public com.hughes.sdg.avro.Site.Builder setSitePhoneBuilder(com.hughes.sdg.avro.types.Phone.Builder value) {
      clearSitePhone();
      SitePhoneBuilder = value;
      return this;
    }

    /**
     * Checks whether the 'SitePhone' field has an active Builder instance
     * @return True if the 'SitePhone' field has an active Builder instance
     */
    public boolean hasSitePhoneBuilder() {
      return SitePhoneBuilder != null;
    }

    /**
      * Clears the value of the 'SitePhone' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.Site.Builder clearSitePhone() {
      SitePhone = null;
      SitePhoneBuilder = null;
      fieldSetFlags()[3] = false;
      return this;
    }

    /**
      * Gets the value of the 'LocationParameters' field.
      * @return The value.
      */
    public java.util.List<com.hughes.sdg.avro.types.NameValueParameter> getLocationParameters() {
      return LocationParameters;
    }

    /**
      * Sets the value of the 'LocationParameters' field.
      * @param value The value of 'LocationParameters'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.Site.Builder setLocationParameters(java.util.List<com.hughes.sdg.avro.types.NameValueParameter> value) {
      validate(fields()[4], value);
      this.LocationParameters = value;
      fieldSetFlags()[4] = true;
      return this;
    }

    /**
      * Checks whether the 'LocationParameters' field has been set.
      * @return True if the 'LocationParameters' field has been set, false otherwise.
      */
    public boolean hasLocationParameters() {
      return fieldSetFlags()[4];
    }


    /**
      * Clears the value of the 'LocationParameters' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.Site.Builder clearLocationParameters() {
      LocationParameters = null;
      fieldSetFlags()[4] = false;
      return this;
    }

    /**
      * Gets the value of the 'SiteAttributes' field.
      * @return The value.
      */
    public java.util.List<com.hughes.sdg.avro.types.NameValueParameter> getSiteAttributes() {
      return SiteAttributes;
    }

    /**
      * Sets the value of the 'SiteAttributes' field.
      * @param value The value of 'SiteAttributes'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.Site.Builder setSiteAttributes(java.util.List<com.hughes.sdg.avro.types.NameValueParameter> value) {
      validate(fields()[5], value);
      this.SiteAttributes = value;
      fieldSetFlags()[5] = true;
      return this;
    }

    /**
      * Checks whether the 'SiteAttributes' field has been set.
      * @return True if the 'SiteAttributes' field has been set, false otherwise.
      */
    public boolean hasSiteAttributes() {
      return fieldSetFlags()[5];
    }


    /**
      * Clears the value of the 'SiteAttributes' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.Site.Builder clearSiteAttributes() {
      SiteAttributes = null;
      fieldSetFlags()[5] = false;
      return this;
    }

    /**
      * Gets the value of the 'NetworkParameters' field.
      * @return The value.
      */
    public java.util.List<com.hughes.sdg.avro.types.NameValueParameter> getNetworkParameters() {
      return NetworkParameters;
    }

    /**
      * Sets the value of the 'NetworkParameters' field.
      * @param value The value of 'NetworkParameters'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.Site.Builder setNetworkParameters(java.util.List<com.hughes.sdg.avro.types.NameValueParameter> value) {
      validate(fields()[6], value);
      this.NetworkParameters = value;
      fieldSetFlags()[6] = true;
      return this;
    }

    /**
      * Checks whether the 'NetworkParameters' field has been set.
      * @return True if the 'NetworkParameters' field has been set, false otherwise.
      */
    public boolean hasNetworkParameters() {
      return fieldSetFlags()[6];
    }


    /**
      * Clears the value of the 'NetworkParameters' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.Site.Builder clearNetworkParameters() {
      NetworkParameters = null;
      fieldSetFlags()[6] = false;
      return this;
    }

    @Override
    @SuppressWarnings("unchecked")
    public Site build() {
      try {
        Site record = new Site();
        if (SiteInformationBuilder != null) {
          record.SiteInformation = this.SiteInformationBuilder.build();
        } else {
          record.SiteInformation = fieldSetFlags()[0] ? this.SiteInformation : (com.hughes.sdg.avro.SiteInformation) defaultValue(fields()[0]);
        }
        if (SiteNameBuilder != null) {
          record.SiteName = this.SiteNameBuilder.build();
        } else {
          record.SiteName = fieldSetFlags()[1] ? this.SiteName : (com.hughes.sdg.avro.types.PersonName) defaultValue(fields()[1]);
        }
        if (SiteAddressBuilder != null) {
          record.SiteAddress = this.SiteAddressBuilder.build();
        } else {
          record.SiteAddress = fieldSetFlags()[2] ? this.SiteAddress : (com.hughes.sdg.avro.types.Address) defaultValue(fields()[2]);
        }
        if (SitePhoneBuilder != null) {
          record.SitePhone = this.SitePhoneBuilder.build();
        } else {
          record.SitePhone = fieldSetFlags()[3] ? this.SitePhone : (com.hughes.sdg.avro.types.Phone) defaultValue(fields()[3]);
        }
        record.LocationParameters = fieldSetFlags()[4] ? this.LocationParameters : (java.util.List<com.hughes.sdg.avro.types.NameValueParameter>) defaultValue(fields()[4]);
        record.SiteAttributes = fieldSetFlags()[5] ? this.SiteAttributes : (java.util.List<com.hughes.sdg.avro.types.NameValueParameter>) defaultValue(fields()[5]);
        record.NetworkParameters = fieldSetFlags()[6] ? this.NetworkParameters : (java.util.List<com.hughes.sdg.avro.types.NameValueParameter>) defaultValue(fields()[6]);
        return record;
      } catch (java.lang.Exception e) {
        throw new org.apache.avro.AvroRuntimeException(e);
      }
    }
  }

  @SuppressWarnings("unchecked")
  private static final org.apache.avro.io.DatumWriter<Site>
    WRITER$ = (org.apache.avro.io.DatumWriter<Site>)MODEL$.createDatumWriter(SCHEMA$);

  @Override public void writeExternal(java.io.ObjectOutput out)
    throws java.io.IOException {
    WRITER$.write(this, SpecificData.getEncoder(out));
  }

  @SuppressWarnings("unchecked")
  private static final org.apache.avro.io.DatumReader<Site>
    READER$ = (org.apache.avro.io.DatumReader<Site>)MODEL$.createDatumReader(SCHEMA$);

  @Override public void readExternal(java.io.ObjectInput in)
    throws java.io.IOException {
    READER$.read(this, SpecificData.getDecoder(in));
  }

}
