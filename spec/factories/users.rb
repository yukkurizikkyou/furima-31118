FactoryBot.define do
  factory :user do
    name                   { Faker::JapaneseMedia::OnePiece.character }
    email                  { Faker::Internet.free_email }
    password               { 'asdf12' }
    password_confirmation  { password }
    first_name             { Gimei.first.kanji }
    last_name              { Gimei.last.kanji }
    first_name_kana        { Gimei.first.katakana }
    last_name_kana         { Gimei.last.katakana }
    birthday               { Faker::Date.birthday }
  end
end