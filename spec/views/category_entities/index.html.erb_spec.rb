require 'rails_helper'

RSpec.describe "category_entities/index", type: :view do
  before(:each) do
    assign(:category_entities, [
      CategoryEntity.create!(
        category: nil,
        entity: nil
      ),
      CategoryEntity.create!(
        category: nil,
        entity: nil
      )
    ])
  end

  it "renders a list of category_entities" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
