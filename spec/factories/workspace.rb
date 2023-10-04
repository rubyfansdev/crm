FactoryBot.define do
  factory :workspace do
    title { 'MyWorkspace' }
    association :author, factory: :user
  end
end
