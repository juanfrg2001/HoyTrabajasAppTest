require 'rails_helper'

RSpec.describe "banks/show", type: :view do
  before(:each) do
    @bank = assign(:bank, Bank.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
