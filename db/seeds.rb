# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'rest-client'
# require 'json'

User.destroy_all

# 5.times do
#     Language.create(name: Faker::Nation.language)
# end

translator = Google::Cloud::Translate.new version: :v2, project_id: ENV["CLOUD_PROJECT_ID"]
languages = translator.languages "en"
languages.each { |lang| Language.find_or_create_by(name: lang.name, code: lang.code)}

10.times do
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

# message = Message.create(content: "hello world", user_id: 1, chat_id: 1)
# key = 'trnsl.1.1.20200305T004037Z.35253689b9ae86b3.38c70dc7d0c2007f85bb58467068c73356687475'
# result = RestClient.get("https://translate.yandex.net/api/v1.5/tr.json/translate", headers={'key' => key, 'text' => 'hello', 'lang' => 'es'})
# parse = JSON.parse(result)