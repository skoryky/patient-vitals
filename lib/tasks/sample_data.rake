namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    30.times do |n|
      bed = n + 1
      name = Faker::Name
      mrn = (n + 1) * 1000
      patient = Patient.create(bed: bed, first_name: name.first_name, last_name: name.last_name, mrn: mrn)
      next unless patient

      start_time = 1.day.ago
      20.times do |n|
        patient.vitals_readings.create(created_at: start_time + (n.hours),
                                       bp_diastolic: Random.rand(150),
                                       bp_systolic: 50 + Random.rand(190),
                                       heart_rate: Random.rand(230),
                                       respiratory_rate: Random.rand(30),
                                       temperature_celsius: 24 + Random.rand(23))
      end
    end
  end
end
