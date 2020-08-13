class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate #, :author
  
  belongs_to :kind
  has_many :phones
  has_one :address

  # def author
  #   "Marcos Rocha"
  # end
  
  meta do 
    { author: "Marcos Rocha" }
  end

  def attributes(*args)
    h = super(*args)
    # PT_BR h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank? # Formato internacional
    h
  end
end