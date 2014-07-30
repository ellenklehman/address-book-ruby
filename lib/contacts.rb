class Contact
  @@all_contacts = []

  def initialize(name)
    @name = name
    @phones = []
    @emails = []
    @addresses = []
  end

  def add_phone(number)
    phone = Phone.new(number)
    @phones << phone
  end

  def phones
    @phones.each_with_index do |item, index|
      puts "#{index+1}." + item.phone
    end
  end

  def edit_phone(choice, new_number)
    @phones[choice.to_i - 1] = Phone.new(new_number)
  end

  def edit_email(choice, new_email)
    @emails[choice.to_i - 1] = Email.new(new_email)
  end

  def edit_address(choice, new_address)
    @addresses[choice.to_i - 1] = Address.new(new_address)
  end

  def add_email(email)
    email = Email.new(email)
    @emails << email
  end

  def emails
    @emails.each_with_index do |item, index|
      puts "#{index+1}." + item.email
    end
  end

  def add_address(address)
    address = Address.new(address)
    @addresses << address
  end

  def addresses
    @addresses.each_with_index do |item, index|
      puts "#{index+1}." + item.address
    end
  end

  def name
    @name
  end

  def save
    @@all_contacts << self
  end

  def Contact.all_names
    @@all_contacts.each_with_index do |item, index|
      puts item.name
    end
  end
  def Contact.all
    @@all_contacts
  end

end
