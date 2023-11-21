require 'rails_helper'

RSpec.describe "homes/show", type: :view do
  before(:each) do
    assign(:home, Home.create!(
      index: "Index"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Index/)
  end
end
