require 'spec_helper'

describe Patient do

  let(:patient) { FactoryGirl.create(:patient) }

  subject { patient }

  it { should be_valid }
  it { should respond_to(:bed) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:mrn) }

  %w[bed first_name last_name mrn].each do |attribute|
    context "when #{attribute} is not present" do
      before { patient.send("#{attribute}=", nil) }
      it { should_not be_valid }
    end

    context "when #{attribute} is too long" do
      before { patient.send("#{attribute}=", 'a' * (Patient.const_get("MAX_#{attribute.upcase}_LENGTH") + 1)) }
      it { should_not be_valid }
    end
  end

  context 'when mrn is already taken' do
    let(:duplicate_patient) { FactoryGirl.build(:patient, mrn: patient.mrn) }
    it { expect(duplicate_patient).not_to be_valid }
  end

end
