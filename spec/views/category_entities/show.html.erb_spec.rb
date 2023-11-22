require 'rails_helper'

RSpec.describe "category_entities/show", type: :view do
  before(:each) do
    assign(:category_entity, CategoryEntity.create!(
      category: nil,
      entity: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
