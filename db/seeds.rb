# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'rest-client'
# require 'json'

#User.destroy_all

# 5.times do
#     Language.create(name: Faker::Nation.language)
# end

translator = Google::Cloud::Translate.new version: :v2, project_id: ENV["CLOUD_PROJECT_ID"]
# this languages line looks weird but the "en" just returns all of the api's possible languages in english, so the drop down menu choices are all in english, i.e. you choose 'spanish' not 'espanol' but the 2 letter codes are always the same
languages = translator.languages "en"
languages.each { |lang| Language.find_or_create_by(name: lang.name, code: lang.code)}

15.times do
    User.create(
        name: Faker::Name.name, 
        email: Faker::Internet.email, 
        password: "password", 
        password_confirmation: "password", 
        bio: Faker::Quote.famous_last_words, 
        country: Faker::Address.country,
        language: Language.all.sample
        )
end