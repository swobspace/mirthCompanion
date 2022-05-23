require 'rails_helper'

RSpec.describe "software_interfaces/new", type: :view do
  before(:each) do
    assign(:software_interface, SoftwareInterface.new(
      software: nil,
      name: "MyString",
      hostname: "MyString",
      ipaddress: "",
      description: nil
    ))
  end

  it "renders new software_interface form" do
    render

    assert_select "form[action=?][method=?]", software_interfaces_path, "post" do

      assert_select "input[name=?]", "software_interface[software_id]"

      assert_select "input[name=?]", "software_interface[name]"

      assert_select "input[name=?]", "software_interface[hostname]"

      assert_select "input[name=?]", "software_interface[ipaddress]"

      assert_select "input[name=?]", "software_interface[description]"
    end
  end
end
