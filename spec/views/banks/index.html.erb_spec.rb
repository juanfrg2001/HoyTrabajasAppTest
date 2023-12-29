require 'rails_helper'

RSpec.describe "banks/index", type: :view do
  before(:each) do
    assign(:banks, [
      Bank.create!(
        name: "Name"
      ),
      Bank.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of banks" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
