FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {'test12'}
    password_confirmation {'test12'}
    name_second           {'漢字'}
    name_first            {'ひらがな'}
    kana_second           {'カタカナ'}
    kana_first            {'カタカナ'}
    birth              {Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today)}
  end
end