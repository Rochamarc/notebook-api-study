module V2
  class ContactSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :birthdate 
    
    meta do 
      { 
        version: "2.0" 
      }
    end

    def attributes(*args)
      h = super(*args)
      h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank? # Formato internacional
      h
    end
  end
end
