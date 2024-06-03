FactoryBot.define do
  factory :doctor do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    age { Faker::Number.number(digits: 2) }
    profession { 'Psicología' }
    specialty { 'Psicoterapeuta' }
    college_number { Faker::Number.number(digits: 10) }
    user
  end
end
