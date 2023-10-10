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
public class CommonMessage extends org.apache.avro.specific.SpecificRecordBase implements org.apache.avro.specific.SpecificRecord {
  private static final long serialVersionUID = -1096605640223061480L;
  public static final org.apache.avro.Schema SCHEMA$ = new org.apache.avro.Schema.Parser().parse("{\"type\":\"record\",\"name\":\"CommonMessage\",\"namespace\":\"com.hughes.sdg.avro\",\"fields\":[{\"name\":\"MessageHeader\",\"type\":{\"type\":\"record\",\"name\":\"MessageHeader\",\"fields\":[{\"name\":\"TransactionSequenceId\",\"type\":\"string\"},{\"name\":\"TransactionDateTime\",\"type\":\"string\"},{\"name\":\"MessageName\",\"type\":\"string\"},{\"name\":\"CorrelationId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"Origin\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ServiceName\",\"type\":[\"null\",\"string\"],\"default\":null}]}},{\"name\":\"MessageData\",\"type\":{\"type\":\"record\",\"name\":\"MessageData\",\"fields\":[{\"name\":\"MessageParameters\",\"type\":[\"null\",{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"NameValueParameter\",\"namespace\":\"com.hughes.sdg.avro.types\",\"fields\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"value\",\"type\":\"string\"}]}}],\"default\":null},{\"name\":\"CustomerInfo\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"CustomerInfo\",\"fields\":[{\"name\":\"CustomerId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ClassA\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"CompanyName\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"CustomerCategory\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"CustomerType\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ContactName\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"PersonName\",\"namespace\":\"com.hughes.sdg.avro.types\",\"fields\":[{\"name\":\"FirstName\",\"type\":\"string\"},{\"name\":\"MiddleName\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"LastName\",\"type\":\"string\"}]}],\"default\":null},{\"name\":\"ContactAddress\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"Address\",\"namespace\":\"com.hughes.sdg.avro.types\",\"fields\":[{\"name\":\"Address1\",\"type\":\"string\"},{\"name\":\"Address2\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"City\",\"type\":\"string\"},{\"name\":\"State\",\"type\":\"string\"},{\"name\":\"Zip\",\"type\":\"string\"},{\"name\":\"Country\",\"type\":\"string\"},{\"name\":\"Latitude\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"Longitude\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"USPSBarCodeNumber\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"DPVCode\",\"type\":[\"null\",\"string\"],\"default\":null}]}],\"default\":null},{\"name\":\"CustomerPhone\",\"type\":[\"null\",{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"Phone\",\"namespace\":\"com.hughes.sdg.avro.types\",\"fields\":[{\"name\":\"Number\",\"type\":\"string\"},{\"name\":\"Type\",\"type\":\"string\"},{\"name\":\"Use\",\"type\":[\"null\",\"string\"],\"default\":null}]}}],\"default\":null},{\"name\":\"Email\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"BillingName\",\"type\":[\"null\",\"com.hughes.sdg.avro.types.PersonName\"],\"default\":null},{\"name\":\"BillingAddress\",\"type\":[\"null\",\"com.hughes.sdg.avro.types.Address\"],\"default\":null},{\"name\":\"PaymentInfo\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"PaymentInfo\",\"namespace\":\"com.hughes.sdg.avro.types\",\"fields\":[{\"name\":\"BillingMethod\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"CreditCardInfo\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"CreditCardInfo\",\"fields\":[{\"name\":\"Type\",\"type\":\"string\"},{\"name\":\"Number\",\"type\":\"string\"},{\"name\":\"ExpirationMonth\",\"type\":\"string\"},{\"name\":\"ExpirationYear\",\"type\":\"string\"},{\"name\":\"CVV\",\"type\":[\"null\",\"string\"],\"default\":null}]}],\"default\":null},{\"name\":\"BankAccountInfo\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"BankAccountInfo\",\"fields\":[{\"name\":\"AccountNumber\",\"type\":\"string\"},{\"name\":\"RoutingNumber\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"AgencyNumber\",\"type\":\"string\"},{\"name\":\"BankCode\",\"type\":\"string\"}]}],\"default\":null}]}],\"default\":null},{\"name\":\"CustomerAttributes\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"com.hughes.sdg.avro.types.NameValueParameter\"}],\"default\":null}]}],\"default\":null},{\"name\":\"Orders\",\"type\":[\"null\",{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"Order\",\"fields\":[{\"name\":\"OrderInformation\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"OrderInformation\",\"fields\":[{\"name\":\"OrderId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"OrderStatusCd\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"MAN\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"SAN\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ClassA\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"SourceId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"CompanyName\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"BusinessModel\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"PIN\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"UpgradeOrderId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"FSOId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"FSOStatus\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"CreateDt\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ModifyDt\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"CancelDt\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"CancelReasonCd\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"OrderNotes\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"CustomerNotes\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"IsUpgrade\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ErrorFlag\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"AgentId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"OrderType\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ChargingRule\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"Email\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ServiceList\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"string\"}],\"default\":null},{\"name\":\"PaymentCd\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"PaymentOption\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"UpfrontChargeAmt\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"SalesChannelCd\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ContractId\",\"type\":[\"null\",\"string\"],\"default\":null}]}],\"default\":null},{\"name\":\"InstallName\",\"type\":[\"null\",\"com.hughes.sdg.avro.types.PersonName\"],\"default\":null},{\"name\":\"InstallAddress\",\"type\":[\"null\",\"com.hughes.sdg.avro.types.Address\"],\"default\":null},{\"name\":\"InstallPhone\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"com.hughes.sdg.avro.types.Phone\"}],\"default\":null},{\"name\":\"BillingName\",\"type\":[\"null\",\"com.hughes.sdg.avro.types.PersonName\"],\"default\":null},{\"name\":\"BillingAddress\",\"type\":[\"null\",\"com.hughes.sdg.avro.types.Address\"],\"default\":null},{\"name\":\"PaymentInfo\",\"type\":[\"null\",\"com.hughes.sdg.avro.types.PaymentInfo\"],\"default\":null},{\"name\":\"OrderedOfferDetails\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"OrderedOfferDetails\",\"fields\":[{\"name\":\"OfferName\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ProgramId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"PackageId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ProgramCd\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ProgramNm\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"PackageNm\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"Subscriptions\",\"type\":[\"null\",{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"Subscription\",\"fields\":[{\"name\":\"SubscriptionId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"SubscriptionStatusCd\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"Description\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ProvisioningDt\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"PlanId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"PlanNm\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ServiceOfferingId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ServiceOfferingNm\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ServiceDealId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ServiceDealNm\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ServiceDealAttributes\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"com.hughes.sdg.avro.types.NameValueParameter\"}],\"default\":null},{\"name\":\"BillingDealId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"BillingDealNm\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"BillingDealAttributes\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"com.hughes.sdg.avro.types.NameValueParameter\"}],\"default\":null},{\"name\":\"ServiceNm\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ExtraParams\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"com.hughes.sdg.avro.types.NameValueParameter\"}],\"default\":null}]}}],\"default\":null}]}],\"default\":null},{\"name\":\"LocationParameters\",\"type\":[\"null\",{\"type\":\"array\",\"item","s\":\"com.hughes.sdg.avro.types.NameValueParameter\"}],\"default\":null},{\"name\":\"CreditReport\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"com.hughes.sdg.avro.types.NameValueParameter\"}],\"default\":null},{\"name\":\"BulkOrderParameters\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"com.hughes.sdg.avro.types.NameValueParameter\"}],\"default\":null},{\"name\":\"TransportParameters\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"com.hughes.sdg.avro.types.NameValueParameter\"}],\"default\":null},{\"name\":\"IPParameters\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"com.hughes.sdg.avro.types.NameValueParameter\"}],\"default\":null},{\"name\":\"OrderAttributes\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"com.hughes.sdg.avro.types.NameValueParameter\"}],\"default\":null}]}}],\"default\":null},{\"name\":\"Sites\",\"type\":[\"null\",{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"Site\",\"fields\":[{\"name\":\"SiteInformation\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"SiteInformation\",\"fields\":[{\"name\":\"SiteId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"SAN\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"SiteType\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ClassA\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ClassB\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ProductId\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"BusinessModel\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"Email\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"SiteStatusCd\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ProvisioningDt\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"InstallDt\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"CreateDt\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ModifyDt\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"CancelDt\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"ServiceList\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"string\"}],\"default\":null}]}],\"default\":null},{\"name\":\"SiteName\",\"type\":[\"null\",\"com.hughes.sdg.avro.types.PersonName\"],\"default\":null},{\"name\":\"SiteAddress\",\"type\":[\"null\",\"com.hughes.sdg.avro.types.Address\"],\"default\":null},{\"name\":\"SitePhone\",\"type\":[\"null\",\"com.hughes.sdg.avro.types.Phone\"],\"default\":null},{\"name\":\"LocationParameters\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"com.hughes.sdg.avro.types.NameValueParameter\"}],\"default\":null},{\"name\":\"SiteAttributes\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"com.hughes.sdg.avro.types.NameValueParameter\"}],\"default\":null},{\"name\":\"NetworkParameters\",\"type\":[\"null\",{\"type\":\"array\",\"items\":\"com.hughes.sdg.avro.types.NameValueParameter\"}],\"default\":null}]}}],\"default\":null}]}},{\"name\":\"headers\",\"type\":[\"null\",{\"type\":\"map\",\"values\":\"string\"}],\"default\":null}],\"version\":1}");
  public static org.apache.avro.Schema getClassSchema() { return SCHEMA$; }

  private static SpecificData MODEL$ = new SpecificData();

  private static final BinaryMessageEncoder<CommonMessage> ENCODER =
      new BinaryMessageEncoder<CommonMessage>(MODEL$, SCHEMA$);

  private static final BinaryMessageDecoder<CommonMessage> DECODER =
      new BinaryMessageDecoder<CommonMessage>(MODEL$, SCHEMA$);

  /**
   * Return the BinaryMessageDecoder instance used by this class.
   */
  public static BinaryMessageDecoder<CommonMessage> getDecoder() {
    return DECODER;
  }

  /**
   * Create a new BinaryMessageDecoder instance for this class that uses the specified {@link SchemaStore}.
   * @param resolver a {@link SchemaStore} used to find schemas by fingerprint
   */
  public static BinaryMessageDecoder<CommonMessage> createDecoder(SchemaStore resolver) {
    return new BinaryMessageDecoder<CommonMessage>(MODEL$, SCHEMA$, resolver);
  }

  /** Serializes this CommonMessage to a ByteBuffer. */
  public java.nio.ByteBuffer toByteBuffer() throws java.io.IOException {
    return ENCODER.encode(this);
  }

  /** Deserializes a CommonMessage from a ByteBuffer. */
  public static CommonMessage fromByteBuffer(
      java.nio.ByteBuffer b) throws java.io.IOException {
    return DECODER.decode(b);
  }

  @Deprecated public com.hughes.sdg.avro.MessageHeader MessageHeader;
  @Deprecated public com.hughes.sdg.avro.MessageData MessageData;
  @Deprecated public java.util.Map<java.lang.CharSequence,java.lang.CharSequence> headers;

  /**
   * Default constructor.  Note that this does not initialize fields
   * to their default values from the schema.  If that is desired then
   * one should use <code>newBuilder()</code>.
   */
  public CommonMessage() {}

  /**
   * All-args constructor.
   * @param MessageHeader The new value for MessageHeader
   * @param MessageData The new value for MessageData
   * @param headers The new value for headers
   */
  public CommonMessage(com.hughes.sdg.avro.MessageHeader MessageHeader, com.hughes.sdg.avro.MessageData MessageData, java.util.Map<java.lang.CharSequence,java.lang.CharSequence> headers) {
    this.MessageHeader = MessageHeader;
    this.MessageData = MessageData;
    this.headers = headers;
  }

  public org.apache.avro.Schema getSchema() { return SCHEMA$; }
  // Used by DatumWriter.  Applications should not call.
  public java.lang.Object get(int field$) {
    switch (field$) {
    case 0: return MessageHeader;
    case 1: return MessageData;
    case 2: return headers;
    default: throw new org.apache.avro.AvroRuntimeException("Bad index");
    }
  }

  // Used by DatumReader.  Applications should not call.
  @SuppressWarnings(value="unchecked")
  public void put(int field$, java.lang.Object value$) {
    switch (field$) {
    case 0: MessageHeader = (com.hughes.sdg.avro.MessageHeader)value$; break;
    case 1: MessageData = (com.hughes.sdg.avro.MessageData)value$; break;
    case 2: headers = (java.util.Map<java.lang.CharSequence,java.lang.CharSequence>)value$; break;
    default: throw new org.apache.avro.AvroRuntimeException("Bad index");
    }
  }

  /**
   * Gets the value of the 'MessageHeader' field.
   * @return The value of the 'MessageHeader' field.
   */
  public com.hughes.sdg.avro.MessageHeader getMessageHeader() {
    return MessageHeader;
  }

  /**
   * Sets the value of the 'MessageHeader' field.
   * @param value the value to set.
   */
  public void setMessageHeader(com.hughes.sdg.avro.MessageHeader value) {
    this.MessageHeader = value;
  }

  /**
   * Gets the value of the 'MessageData' field.
   * @return The value of the 'MessageData' field.
   */
  public com.hughes.sdg.avro.MessageData getMessageData() {
    return MessageData;
  }

  /**
   * Sets the value of the 'MessageData' field.
   * @param value the value to set.
   */
  public void setMessageData(com.hughes.sdg.avro.MessageData value) {
    this.MessageData = value;
  }

  /**
   * Gets the value of the 'headers' field.
   * @return The value of the 'headers' field.
   */
  public java.util.Map<java.lang.CharSequence,java.lang.CharSequence> getHeaders() {
    return headers;
  }

  /**
   * Sets the value of the 'headers' field.
   * @param value the value to set.
   */
  public void setHeaders(java.util.Map<java.lang.CharSequence,java.lang.CharSequence> value) {
    this.headers = value;
  }

  /**
   * Creates a new CommonMessage RecordBuilder.
   * @return A new CommonMessage RecordBuilder
   */
  public static com.hughes.sdg.avro.CommonMessage.Builder newBuilder() {
    return new com.hughes.sdg.avro.CommonMessage.Builder();
  }

  /**
   * Creates a new CommonMessage RecordBuilder by copying an existing Builder.
   * @param other The existing builder to copy.
   * @return A new CommonMessage RecordBuilder
   */
  public static com.hughes.sdg.avro.CommonMessage.Builder newBuilder(com.hughes.sdg.avro.CommonMessage.Builder other) {
    return new com.hughes.sdg.avro.CommonMessage.Builder(other);
  }

  /**
   * Creates a new CommonMessage RecordBuilder by copying an existing CommonMessage instance.
   * @param other The existing instance to copy.
   * @return A new CommonMessage RecordBuilder
   */
  public static com.hughes.sdg.avro.CommonMessage.Builder newBuilder(com.hughes.sdg.avro.CommonMessage other) {
    return new com.hughes.sdg.avro.CommonMessage.Builder(other);
  }

  /**
   * RecordBuilder for CommonMessage instances.
   */
  public static class Builder extends org.apache.avro.specific.SpecificRecordBuilderBase<CommonMessage>
    implements org.apache.avro.data.RecordBuilder<CommonMessage> {

    private com.hughes.sdg.avro.MessageHeader MessageHeader;
    private com.hughes.sdg.avro.MessageHeader.Builder MessageHeaderBuilder;
    private com.hughes.sdg.avro.MessageData MessageData;
    private com.hughes.sdg.avro.MessageData.Builder MessageDataBuilder;
    private java.util.Map<java.lang.CharSequence,java.lang.CharSequence> headers;

    /** Creates a new Builder */
    private Builder() {
      super(SCHEMA$);
    }

    /**
     * Creates a Builder by copying an existing Builder.
     * @param other The existing Builder to copy.
     */
    private Builder(com.hughes.sdg.avro.CommonMessage.Builder other) {
      super(other);
      if (isValidValue(fields()[0], other.MessageHeader)) {
        this.MessageHeader = data().deepCopy(fields()[0].schema(), other.MessageHeader);
        fieldSetFlags()[0] = true;
      }
      if (other.hasMessageHeaderBuilder()) {
        this.MessageHeaderBuilder = com.hughes.sdg.avro.MessageHeader.newBuilder(other.getMessageHeaderBuilder());
      }
      if (isValidValue(fields()[1], other.MessageData)) {
        this.MessageData = data().deepCopy(fields()[1].schema(), other.MessageData);
        fieldSetFlags()[1] = true;
      }
      if (other.hasMessageDataBuilder()) {
        this.MessageDataBuilder = com.hughes.sdg.avro.MessageData.newBuilder(other.getMessageDataBuilder());
      }
      if (isValidValue(fields()[2], other.headers)) {
        this.headers = data().deepCopy(fields()[2].schema(), other.headers);
        fieldSetFlags()[2] = true;
      }
    }

    /**
     * Creates a Builder by copying an existing CommonMessage instance
     * @param other The existing instance to copy.
     */
    private Builder(com.hughes.sdg.avro.CommonMessage other) {
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
      if (isValidValue(fields()[2], other.headers)) {
        this.headers = data().deepCopy(fields()[2].schema(), other.headers);
        fieldSetFlags()[2] = true;
      }
    }

    /**
      * Gets the value of the 'MessageHeader' field.
      * @return The value.
      */
    public com.hughes.sdg.avro.MessageHeader getMessageHeader() {
      return MessageHeader;
    }

    /**
      * Sets the value of the 'MessageHeader' field.
      * @param value The value of 'MessageHeader'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.CommonMessage.Builder setMessageHeader(com.hughes.sdg.avro.MessageHeader value) {
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
    public com.hughes.sdg.avro.MessageHeader.Builder getMessageHeaderBuilder() {
      if (MessageHeaderBuilder == null) {
        if (hasMessageHeader()) {
          setMessageHeaderBuilder(com.hughes.sdg.avro.MessageHeader.newBuilder(MessageHeader));
        } else {
          setMessageHeaderBuilder(com.hughes.sdg.avro.MessageHeader.newBuilder());
        }
      }
      return MessageHeaderBuilder;
    }

    /**
     * Sets the Builder instance for the 'MessageHeader' field
     * @param value The builder instance that must be set.
     * @return This builder.
     */
    public com.hughes.sdg.avro.CommonMessage.Builder setMessageHeaderBuilder(com.hughes.sdg.avro.MessageHeader.Builder value) {
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
    public com.hughes.sdg.avro.CommonMessage.Builder clearMessageHeader() {
      MessageHeader = null;
      MessageHeaderBuilder = null;
      fieldSetFlags()[0] = false;
      return this;
    }

    /**
      * Gets the value of the 'MessageData' field.
      * @return The value.
      */
    public com.hughes.sdg.avro.MessageData getMessageData() {
      return MessageData;
    }

    /**
      * Sets the value of the 'MessageData' field.
      * @param value The value of 'MessageData'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.CommonMessage.Builder setMessageData(com.hughes.sdg.avro.MessageData value) {
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
    public com.hughes.sdg.avro.MessageData.Builder getMessageDataBuilder() {
      if (MessageDataBuilder == null) {
        if (hasMessageData()) {
          setMessageDataBuilder(com.hughes.sdg.avro.MessageData.newBuilder(MessageData));
        } else {
          setMessageDataBuilder(com.hughes.sdg.avro.MessageData.newBuilder());
        }
      }
      return MessageDataBuilder;
    }

    /**
     * Sets the Builder instance for the 'MessageData' field
     * @param value The builder instance that must be set.
     * @return This builder.
     */
    public com.hughes.sdg.avro.CommonMessage.Builder setMessageDataBuilder(com.hughes.sdg.avro.MessageData.Builder value) {
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
    public com.hughes.sdg.avro.CommonMessage.Builder clearMessageData() {
      MessageData = null;
      MessageDataBuilder = null;
      fieldSetFlags()[1] = false;
      return this;
    }

    /**
      * Gets the value of the 'headers' field.
      * @return The value.
      */
    public java.util.Map<java.lang.CharSequence,java.lang.CharSequence> getHeaders() {
      return headers;
    }

    /**
      * Sets the value of the 'headers' field.
      * @param value The value of 'headers'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.CommonMessage.Builder setHeaders(java.util.Map<java.lang.CharSequence,java.lang.CharSequence> value) {
      validate(fields()[2], value);
      this.headers = value;
      fieldSetFlags()[2] = true;
      return this;
    }

    /**
      * Checks whether the 'headers' field has been set.
      * @return True if the 'headers' field has been set, false otherwise.
      */
    public boolean hasHeaders() {
      return fieldSetFlags()[2];
    }


    /**
      * Clears the value of the 'headers' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.CommonMessage.Builder clearHeaders() {
      headers = null;
      fieldSetFlags()[2] = false;
      return this;
    }

    @Override
    @SuppressWarnings("unchecked")
    public CommonMessage build() {
      try {
        CommonMessage record = new CommonMessage();
        if (MessageHeaderBuilder != null) {
          record.MessageHeader = this.MessageHeaderBuilder.build();
        } else {
          record.MessageHeader = fieldSetFlags()[0] ? this.MessageHeader : (com.hughes.sdg.avro.MessageHeader) defaultValue(fields()[0]);
        }
        if (MessageDataBuilder != null) {
          record.MessageData = this.MessageDataBuilder.build();
        } else {
          record.MessageData = fieldSetFlags()[1] ? this.MessageData : (com.hughes.sdg.avro.MessageData) defaultValue(fields()[1]);
        }
        record.headers = fieldSetFlags()[2] ? this.headers : (java.util.Map<java.lang.CharSequence,java.lang.CharSequence>) defaultValue(fields()[2]);
        return record;
      } catch (java.lang.Exception e) {
        throw new org.apache.avro.AvroRuntimeException(e);
      }
    }
  }

  @SuppressWarnings("unchecked")
  private static final org.apache.avro.io.DatumWriter<CommonMessage>
    WRITER$ = (org.apache.avro.io.DatumWriter<CommonMessage>)MODEL$.createDatumWriter(SCHEMA$);

  @Override public void writeExternal(java.io.ObjectOutput out)
    throws java.io.IOException {
    WRITER$.write(this, SpecificData.getEncoder(out));
  }

  @SuppressWarnings("unchecked")
  private static final org.apache.avro.io.DatumReader<CommonMessage>
    READER$ = (org.apache.avro.io.DatumReader<CommonMessage>)MODEL$.createDatumReader(SCHEMA$);

  @Override public void readExternal(java.io.ObjectInput in)
    throws java.io.IOException {
    READER$.read(this, SpecificData.getDecoder(in));
  }

}