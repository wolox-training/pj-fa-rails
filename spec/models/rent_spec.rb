require 'rails_helper'

describe Rent do
  subject(:rent) { build(:rent) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:book) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }

  it { is_expected.to belong_to(:book) }
  it { is_expected.to belong_to(:user) }
end
