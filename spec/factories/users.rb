FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.free_email }
    password              { '123456' }
    password_confirmation {password}
    producers             { Faker::Name.initials(number: 4) }
    crops                 { Faker::Name.initials(number: 4) }
    address               { Faker::Name.initials(number: 6) }
    contact               { '000-0000-0000'}
    url                   { 'http//aaa@aaa.jp'}
    profile               { Faker::Name.initials(number: 10) }

    after(:build) do |user|
      user.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

