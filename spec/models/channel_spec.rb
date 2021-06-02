require 'rails_helper'

RSpec.describe Channel, type: :model do
  it { is_expected.to validate_presence_of(:uid) }

  it "should get plain factory working" do
    f = FactoryBot.create(:channel)
    g = FactoryBot.create(:channel)
    expect(f).to be_valid
    expect(g).to be_valid
    expect(f).to validate_uniqueness_of(:uid).case_insensitive
  end

  it "to_s returns value" do
    f = FactoryBot.create(:channel, properties: {name: "special channel"})
    expect("#{f}").to match ("special channel")
  end

end