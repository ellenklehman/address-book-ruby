require 'rspec'
require 'contacts'

describe Contact do
  it 'is initialized with a name, phone, email and address' do
    test_contact = Contact.new("Suzy Jones", "555-555-5555", "suzy@woohoo.com", "123 Main Street, Mainville, MN 55555")
    test_contact.should be_an_instance_of Contact
  end

  describe '.all_names' do
    it 'returns a list of all contact names' do
      test_contact = Contact.new("Suzy Jones", "555-555-5555", "suzy@woohoo.com", "123 Main Street, Mainville, MN 55555")
      test_contact.save
      Contact.all_names.should eq "Suzy Jones"
    end
  end

end
