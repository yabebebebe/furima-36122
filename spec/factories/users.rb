FactoryBot.define do
  factory :user do
    nickname              {'yumeno'}
    email                 {'test@email'}
    password              {'test0000'}
    password_confirmation {password}
    last_name             {'伊藤'}
    first_name            {'夢乃'}
    last_name_reading     {'イトウ'}
    first_name_reading    {'ユメノ'}
    birthday              {'1997-10-07'}
  end
end
