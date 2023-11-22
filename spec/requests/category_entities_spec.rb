require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/category_entities', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # CategoryEntity. As you add validations to CategoryEntity, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      CategoryEntity.create! valid_attributes
      get category_entities_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      category_entity = CategoryEntity.create! valid_attributes
      get category_entity_url(category_entity)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_category_entity_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      category_entity = CategoryEntity.create! valid_attributes
      get edit_category_entity_url(category_entity)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new CategoryEntity' do
        expect do
          post category_entities_url, params: { category_entity: valid_attributes }
        end.to change(CategoryEntity, :count).by(1)
      end

      it 'redirects to the created category_entity' do
        post category_entities_url, params: { category_entity: valid_attributes }
        expect(response).to redirect_to(category_entity_url(CategoryEntity.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new CategoryEntity' do
        expect do
          post category_entities_url, params: { category_entity: invalid_attributes }
        end.to change(CategoryEntity, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post category_entities_url, params: { category_entity: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested category_entity' do
        category_entity = CategoryEntity.create! valid_attributes
        patch category_entity_url(category_entity), params: { category_entity: new_attributes }
        category_entity.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the category_entity' do
        category_entity = CategoryEntity.create! valid_attributes
        patch category_entity_url(category_entity), params: { category_entity: new_attributes }
        category_entity.reload
        expect(response).to redirect_to(category_entity_url(category_entity))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        category_entity = CategoryEntity.create! valid_attributes
        patch category_entity_url(category_entity), params: { category_entity: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested category_entity' do
      category_entity = CategoryEntity.create! valid_attributes
      expect do
        delete category_entity_url(category_entity)
      end.to change(CategoryEntity, :count).by(-1)
    end

    it 'redirects to the category_entities list' do
      category_entity = CategoryEntity.create! valid_attributes
      delete category_entity_url(category_entity)
      expect(response).to redirect_to(category_entities_url)
    end
  end
end
