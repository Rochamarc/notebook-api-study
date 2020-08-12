class Contact < ApplicationRecord
  belongs_to :kind #, optional: true
  has_many :phones
  has_one :address
  # Aceita atributos dos telefones
  accepts_nested_attributes_for :phones, allow_destroy: true 
  accepts_nested_attributes_for :address, update_only: true  # Singular pois cada contato possui somente um endereço, so permite atualizacao de endereço unico

  #Sobrescreve a funcao as_json
  def as_json(options={})
    h = super(options)
    h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    h
  end

  # def to_br
  #   {
  #     name: self.name,
  #     email: self.email,
  #     birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
  #   }
  # end
# 
  # def author
  #   "Marcos Rocha"
  # end
  # 
  # def kind_description
  #   self.kind.description
  # end
  # def as_json(options={})
  #   # Invoca o metodo mae, e passa somente os metodos que voce deseja
  #   super(
  #     root: true,
  #     methods: [:author, :kind_description]
  #     )
  # end

  def hello
    I18n.t('hello')
  end

  def i18n
    I18n.default_locale
  end

end
