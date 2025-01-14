# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'notes/new', type: :view do
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { 'notes' }
    allow(controller).to receive(:action_name) { 'edit' }
    @notable = FactoryBot.create(:server, name: 'xyzmirth')

    @note = assign(:note, FactoryBot.build(:note, notable: @notable))
  end

  it 'renders new note form' do
    render
    assert_select 'form[action=?][method=?]', server_notes_path(@notable), 'post' do
      assert_select 'input[name=?]', 'note[message]'
      assert_select 'input[name=?]', 'note[valid_until]'
    end
  end
end
