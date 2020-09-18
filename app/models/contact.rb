 class Contact < ApplicationRecord
  belongs_to :kind 
  has_many :phones
  has_one :address
  
  # Atributor aninhados
  accepts_nested_attributes_for :phones, allow_destroy: true 
  accepts_nested_attributes_for :address, update_only: true   

  def hello
    I18n.t('hello')
  end

  def i18n
    I18n.default_locale
  end

end
