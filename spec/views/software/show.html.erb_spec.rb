require 'rails_helper'

RSpec.describe "software/show", type: :view do
  let(:location) { FactoryBot.create(:location, lid: 'L1', name: 'Loc One') }
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { 'software' }
    allow(controller).to receive(:action_name) { 'show' }
    @software = assign(:software, Software.create!(
      location: location,
      name: "MySoft",
      vendor: "ACME bg"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/L1/)
    expect(rendered).to match(/MySoft/)
    expect(rendered).to match(/ACME bg/)
  end
end
