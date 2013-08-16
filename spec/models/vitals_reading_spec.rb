require 'spec_helper'

describe VitalsReading do

  let(:vitals_reading) { FactoryGirl.create(:vitals_reading) }

  subject { vitals_reading }

  it { should be_valid }

  it { should respond_to(:bp_diastolic) }
  it { should respond_to(:bp_systolic) }
  it { should respond_to(:heart_rate) }
  it { should respond_to(:respiratory_rate) }
  it { should respond_to(:temperature_celsius) }

  it { should respond_to(:patient_id) }

end
