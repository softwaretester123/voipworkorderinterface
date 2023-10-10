/**
 * Autogenerated by Avro
 *
 * DO NOT EDIT DIRECTLY
 */
package com.hughes.sdg.avro.types;

import org.apache.avro.specific.SpecificData;
import org.apache.avro.message.BinaryMessageEncoder;
import org.apache.avro.message.BinaryMessageDecoder;
import org.apache.avro.message.SchemaStore;

@SuppressWarnings("all")
@org.apache.avro.specific.AvroGenerated
public class PersonName extends org.apache.avro.specific.SpecificRecordBase implements org.apache.avro.specific.SpecificRecord {
  private static final long serialVersionUID = -2545210835590703355L;
  public static final org.apache.avro.Schema SCHEMA$ = new org.apache.avro.Schema.Parser().parse("{\"type\":\"record\",\"name\":\"PersonName\",\"namespace\":\"com.hughes.sdg.avro.types\",\"fields\":[{\"name\":\"FirstName\",\"type\":\"string\"},{\"name\":\"MiddleName\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"LastName\",\"type\":\"string\"}]}");
  public static org.apache.avro.Schema getClassSchema() { return SCHEMA$; }

  private static SpecificData MODEL$ = new SpecificData();

  private static final BinaryMessageEncoder<PersonName> ENCODER =
      new BinaryMessageEncoder<PersonName>(MODEL$, SCHEMA$);

  private static final BinaryMessageDecoder<PersonName> DECODER =
      new BinaryMessageDecoder<PersonName>(MODEL$, SCHEMA$);

  /**
   * Return the BinaryMessageDecoder instance used by this class.
   */
  public static BinaryMessageDecoder<PersonName> getDecoder() {
    return DECODER;
  }

  /**
   * Create a new BinaryMessageDecoder instance for this class that uses the specified {@link SchemaStore}.
   * @param resolver a {@link SchemaStore} used to find schemas by fingerprint
   */
  public static BinaryMessageDecoder<PersonName> createDecoder(SchemaStore resolver) {
    return new BinaryMessageDecoder<PersonName>(MODEL$, SCHEMA$, resolver);
  }

  /** Serializes this PersonName to a ByteBuffer. */
  public java.nio.ByteBuffer toByteBuffer() throws java.io.IOException {
    return ENCODER.encode(this);
  }

  /** Deserializes a PersonName from a ByteBuffer. */
  public static PersonName fromByteBuffer(
      java.nio.ByteBuffer b) throws java.io.IOException {
    return DECODER.decode(b);
  }

  @Deprecated public java.lang.CharSequence FirstName;
  @Deprecated public java.lang.CharSequence MiddleName;
  @Deprecated public java.lang.CharSequence LastName;

  /**
   * Default constructor.  Note that this does not initialize fields
   * to their default values from the schema.  If that is desired then
   * one should use <code>newBuilder()</code>.
   */
  public PersonName() {}

  /**
   * All-args constructor.
   * @param FirstName The new value for FirstName
   * @param MiddleName The new value for MiddleName
   * @param LastName The new value for LastName
   */
  public PersonName(java.lang.CharSequence FirstName, java.lang.CharSequence MiddleName, java.lang.CharSequence LastName) {
    this.FirstName = FirstName;
    this.MiddleName = MiddleName;
    this.LastName = LastName;
  }

  public org.apache.avro.Schema getSchema() { return SCHEMA$; }
  // Used by DatumWriter.  Applications should not call.
  public java.lang.Object get(int field$) {
    switch (field$) {
    case 0: return FirstName;
    case 1: return MiddleName;
    case 2: return LastName;
    default: throw new org.apache.avro.AvroRuntimeException("Bad index");
    }
  }

  // Used by DatumReader.  Applications should not call.
  @SuppressWarnings(value="unchecked")
  public void put(int field$, java.lang.Object value$) {
    switch (field$) {
    case 0: FirstName = (java.lang.CharSequence)value$; break;
    case 1: MiddleName = (java.lang.CharSequence)value$; break;
    case 2: LastName = (java.lang.CharSequence)value$; break;
    default: throw new org.apache.avro.AvroRuntimeException("Bad index");
    }
  }

  /**
   * Gets the value of the 'FirstName' field.
   * @return The value of the 'FirstName' field.
   */
  public java.lang.CharSequence getFirstName() {
    return FirstName;
  }

  /**
   * Sets the value of the 'FirstName' field.
   * @param value the value to set.
   */
  public void setFirstName(java.lang.CharSequence value) {
    this.FirstName = value;
  }

  /**
   * Gets the value of the 'MiddleName' field.
   * @return The value of the 'MiddleName' field.
   */
  public java.lang.CharSequence getMiddleName() {
    return MiddleName;
  }

  /**
   * Sets the value of the 'MiddleName' field.
   * @param value the value to set.
   */
  public void setMiddleName(java.lang.CharSequence value) {
    this.MiddleName = value;
  }

  /**
   * Gets the value of the 'LastName' field.
   * @return The value of the 'LastName' field.
   */
  public java.lang.CharSequence getLastName() {
    return LastName;
  }

  /**
   * Sets the value of the 'LastName' field.
   * @param value the value to set.
   */
  public void setLastName(java.lang.CharSequence value) {
    this.LastName = value;
  }

  /**
   * Creates a new PersonName RecordBuilder.
   * @return A new PersonName RecordBuilder
   */
  public static com.hughes.sdg.avro.types.PersonName.Builder newBuilder() {
    return new com.hughes.sdg.avro.types.PersonName.Builder();
  }

  /**
   * Creates a new PersonName RecordBuilder by copying an existing Builder.
   * @param other The existing builder to copy.
   * @return A new PersonName RecordBuilder
   */
  public static com.hughes.sdg.avro.types.PersonName.Builder newBuilder(com.hughes.sdg.avro.types.PersonName.Builder other) {
    return new com.hughes.sdg.avro.types.PersonName.Builder(other);
  }

  /**
   * Creates a new PersonName RecordBuilder by copying an existing PersonName instance.
   * @param other The existing instance to copy.
   * @return A new PersonName RecordBuilder
   */
  public static com.hughes.sdg.avro.types.PersonName.Builder newBuilder(com.hughes.sdg.avro.types.PersonName other) {
    return new com.hughes.sdg.avro.types.PersonName.Builder(other);
  }

  /**
   * RecordBuilder for PersonName instances.
   */
  public static class Builder extends org.apache.avro.specific.SpecificRecordBuilderBase<PersonName>
    implements org.apache.avro.data.RecordBuilder<PersonName> {

    private java.lang.CharSequence FirstName;
    private java.lang.CharSequence MiddleName;
    private java.lang.CharSequence LastName;

    /** Creates a new Builder */
    private Builder() {
      super(SCHEMA$);
    }

    /**
     * Creates a Builder by copying an existing Builder.
     * @param other The existing Builder to copy.
     */
    private Builder(com.hughes.sdg.avro.types.PersonName.Builder other) {
      super(other);
      if (isValidValue(fields()[0], other.FirstName)) {
        this.FirstName = data().deepCopy(fields()[0].schema(), other.FirstName);
        fieldSetFlags()[0] = true;
      }
      if (isValidValue(fields()[1], other.MiddleName)) {
        this.MiddleName = data().deepCopy(fields()[1].schema(), other.MiddleName);
        fieldSetFlags()[1] = true;
      }
      if (isValidValue(fields()[2], other.LastName)) {
        this.LastName = data().deepCopy(fields()[2].schema(), other.LastName);
        fieldSetFlags()[2] = true;
      }
    }

    /**
     * Creates a Builder by copying an existing PersonName instance
     * @param other The existing instance to copy.
     */
    private Builder(com.hughes.sdg.avro.types.PersonName other) {
            super(SCHEMA$);
      if (isValidValue(fields()[0], other.FirstName)) {
        this.FirstName = data().deepCopy(fields()[0].schema(), other.FirstName);
        fieldSetFlags()[0] = true;
      }
      if (isValidValue(fields()[1], other.MiddleName)) {
        this.MiddleName = data().deepCopy(fields()[1].schema(), other.MiddleName);
        fieldSetFlags()[1] = true;
      }
      if (isValidValue(fields()[2], other.LastName)) {
        this.LastName = data().deepCopy(fields()[2].schema(), other.LastName);
        fieldSetFlags()[2] = true;
      }
    }

    /**
      * Gets the value of the 'FirstName' field.
      * @return The value.
      */
    public java.lang.CharSequence getFirstName() {
      return FirstName;
    }

    /**
      * Sets the value of the 'FirstName' field.
      * @param value The value of 'FirstName'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.types.PersonName.Builder setFirstName(java.lang.CharSequence value) {
      validate(fields()[0], value);
      this.FirstName = value;
      fieldSetFlags()[0] = true;
      return this;
    }

    /**
      * Checks whether the 'FirstName' field has been set.
      * @return True if the 'FirstName' field has been set, false otherwise.
      */
    public boolean hasFirstName() {
      return fieldSetFlags()[0];
    }


    /**
      * Clears the value of the 'FirstName' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.types.PersonName.Builder clearFirstName() {
      FirstName = null;
      fieldSetFlags()[0] = false;
      return this;
    }

    /**
      * Gets the value of the 'MiddleName' field.
      * @return The value.
      */
    public java.lang.CharSequence getMiddleName() {
      return MiddleName;
    }

    /**
      * Sets the value of the 'MiddleName' field.
      * @param value The value of 'MiddleName'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.types.PersonName.Builder setMiddleName(java.lang.CharSequence value) {
      validate(fields()[1], value);
      this.MiddleName = value;
      fieldSetFlags()[1] = true;
      return this;
    }

    /**
      * Checks whether the 'MiddleName' field has been set.
      * @return True if the 'MiddleName' field has been set, false otherwise.
      */
    public boolean hasMiddleName() {
      return fieldSetFlags()[1];
    }


    /**
      * Clears the value of the 'MiddleName' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.types.PersonName.Builder clearMiddleName() {
      MiddleName = null;
      fieldSetFlags()[1] = false;
      return this;
    }

    /**
      * Gets the value of the 'LastName' field.
      * @return The value.
      */
    public java.lang.CharSequence getLastName() {
      return LastName;
    }

    /**
      * Sets the value of the 'LastName' field.
      * @param value The value of 'LastName'.
      * @return This builder.
      */
    public com.hughes.sdg.avro.types.PersonName.Builder setLastName(java.lang.CharSequence value) {
      validate(fields()[2], value);
      this.LastName = value;
      fieldSetFlags()[2] = true;
      return this;
    }

    /**
      * Checks whether the 'LastName' field has been set.
      * @return True if the 'LastName' field has been set, false otherwise.
      */
    public boolean hasLastName() {
      return fieldSetFlags()[2];
    }


    /**
      * Clears the value of the 'LastName' field.
      * @return This builder.
      */
    public com.hughes.sdg.avro.types.PersonName.Builder clearLastName() {
      LastName = null;
      fieldSetFlags()[2] = false;
      return this;
    }

    @Override
    @SuppressWarnings("unchecked")
    public PersonName build() {
      try {
        PersonName record = new PersonName();
        record.FirstName = fieldSetFlags()[0] ? this.FirstName : (java.lang.CharSequence) defaultValue(fields()[0]);
        record.MiddleName = fieldSetFlags()[1] ? this.MiddleName : (java.lang.CharSequence) defaultValue(fields()[1]);
        record.LastName = fieldSetFlags()[2] ? this.LastName : (java.lang.CharSequence) defaultValue(fields()[2]);
        return record;
      } catch (java.lang.Exception e) {
        throw new org.apache.avro.AvroRuntimeException(e);
      }
    }
  }

  @SuppressWarnings("unchecked")
  private static final org.apache.avro.io.DatumWriter<PersonName>
    WRITER$ = (org.apache.avro.io.DatumWriter<PersonName>)MODEL$.createDatumWriter(SCHEMA$);

  @Override public void writeExternal(java.io.ObjectOutput out)
    throws java.io.IOException {
    WRITER$.write(this, SpecificData.getEncoder(out));
  }

  @SuppressWarnings("unchecked")
  private static final org.apache.avro.io.DatumReader<PersonName>
    READER$ = (org.apache.avro.io.DatumReader<PersonName>)MODEL$.createDatumReader(SCHEMA$);

  @Override public void readExternal(java.io.ObjectInput in)
    throws java.io.IOException {
    READER$.read(this, SpecificData.getDecoder(in));
  }

}