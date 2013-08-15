FactoryGirl.define do

  factory :patient do
    sequence(:bed) { |n| "Bed#{n}" }
    first_name 'English'
    last_name 'Patient'
    mrn { SecureRandom.random_number(1e12.to_i).to_s.ljust(12, '0') }
  end

end
