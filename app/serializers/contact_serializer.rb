class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate #, :author
  
  belongs_to :kind do
    link(:kind) { kind_url(object.kind.id) }
  end
  has_many :phones
  has_one :address

  # Padrao jsonapi
  # link(:self) { contact_path(object.id) } 
  # link(:kind) { kind_path(object.kind.id) }

  link(:self) { contact_url(object.id) } 
  link(:kind) { kind_url(object.kind.id) }

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
