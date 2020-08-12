namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    
    # Uma linha de comando
    %x(rails db:drop db:create db:migrate)
    
    puts "Cadastrando tipos de contatos"
    kinds = %w(Amigo Comercial Conhecidos)
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    ################################

    puts "Cadastrando usuarios"
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end

    ################################

    puts "Cadastrando telefones "
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone )
        contact.phones << phone
        contact.save!
      end
    end

    puts "Cadastrando endereços"

    Contact.all.each do |contact|
      Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
    )
    end

  end
end
