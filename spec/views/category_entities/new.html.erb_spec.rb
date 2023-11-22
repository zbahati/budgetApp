require 'rails_helper'

RSpec.describe 'category_entities/new', type: :view do
  before(:each) do
    assign(:category_entity, CategoryEntity.new(
                               category: nil,
                               entity: nil
                             ))
  end

  it 'renders new category_entity form' do
    render

    assert_select 'form[action=?][method=?]', category_entities_path, 'post' do
      assert_select 'input[name=?]', 'category_entity[category_id]'

      assert_select 'input[name=?]', 'category_entity[entity_id]'
    end
  end
end
