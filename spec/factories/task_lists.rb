FactoryBot.define do
  factory :task_list do
    title { 'MyString' }
    description { 'MyString' }
    association :workspace
  end
end
