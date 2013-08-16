require 'factory_girl'

FactoryGirl.define do

  factory :vitals_reading do
    patient

    bp_diastolic { Random.rand(150) }  # 0 to 150
    bp_systolic { 50 + Random.rand(190) }  # 50 to 240
    heart_rate { Random.rand(230) }  # 0 to 230
    respiratory_rate { Random.rand(30) }  # 0 to 30
    temperature_celsius { 24 + Random.rand(23) }  # 24 to 47
  end

end
