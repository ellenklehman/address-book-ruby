class Contact
  @@all_contacts = []

  def initialize(name, phone, email, address)
    @name = name
    @phone = phone
    @email = email
    @address = address
  end

  def name
    @name
  end

  def save
    @@all_contacts << self
  end

  def Contact.all_names
    @@all_contacts.each_with_index do |item, index|
      return item.name
    end
  end
end
