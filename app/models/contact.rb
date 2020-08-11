class Contact < ApplicationRecord
  belongs_to :kind #, optional: true

  #def author
  #  "Marcos Rocha"
  #end
  #
  #def kind_description
  #  self.kind.description
  #end
  #def as_json(options={})
  #  # Invoca o metodo mae, e passa somente os metodos que voce deseja
  #  super(
  #    root: true,
  #    methods: [:author, :kind_description]
  #    )
  #end

end
