# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list do
    task "MyString"
    done false
  end
end
