translator = Google::Cloud::Translate.new version: :v2, project_id: ENV["CLOUD_PROJECT_ID"]
    # this languages line looks weird but the "en" just returns all of the api's possible languages in english, so the drop down menu choices are all in english, i.e. you choose 'spanish' not 'espanol' but the 2 letter codes are always the same
languages = translator.languages "en"
languages.each { |lang| Language.find_or_create_by(name: lang.name, code: lang.code)}

User.destroy_all
15.times do
    User.create(
        name: Faker::Name.name, 
        email: Faker::Internet.email, 
        avatar: Faker::Avatar.image,
        password: "password", 
        password_confirmation: "password", 
        bio: Faker::Quote.most_interesting_man_in_the_world, 
        country: Faker::Address.country,
        language: Language.all.sample
        )
end