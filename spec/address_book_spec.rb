require 'rspec'
require 'contacts'
require 'phone'
require 'address'
require 'email'

describe Contact do
  it 'is initialized with a name, phone, email and address' do
    test_contact = Contact.new("Suzy Jones")
    test_contact.should be_an_instance_of Contact
  end

  it 'can hold an array of phone numbers' do
    test_contact = Contact.new("Suzy Jones")
    test_phone = Phone.new("5555555555")
    test_contact.save
    test_contact.phone << test_phone
  end

  describe '.all_names' do
    it 'returns a list of all contact names' do
      test_contact = Contact.new("Suzy Jones")
      test_contact.save
      Contact.all_names.should eq "Suzy Jones"
    end
  end
end

describe Phone do
  it 'is initialized with a phone number' do
    test_phone = Phone.new("555555555")
    test_phone.should be_an_instance_of Phone
  end
end

describe Email do
  it 'is initialized with an email address' do
    test_email = Email.new("Mary@wonkers.com")
    test_email.should be_an_instance_of Email
  end
end

describe Address do
  it 'is initialized with an address' do
    test_address = Address.new("123 Main St. Portland, OR 97219")
    test_address.should be_an_instance_of Address
  end
end
