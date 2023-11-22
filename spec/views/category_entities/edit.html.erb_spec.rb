require 'rails_helper'

RSpec.describe "category_entities/edit", type: :view do
  let(:category_entity) {
    CategoryEntity.create!(
      category: nil,
      entity: nil
    )
  }

  before(:each) do
    assign(:category_entity, category_entity)
  end

  it "renders the edit category_entity form" do
    render

    assert_select "form[action=?][method=?]", category_entity_path(category_entity), "post" do

      assert_select "input[name=?]", "category_entity[category_id]"

      assert_select "input[name=?]", "category_entity[entity_id]"
    end
  end
end
