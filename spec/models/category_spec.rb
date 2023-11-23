require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @user = User.create(name: 'Roy Batty', email: 'roy@batty.com', password: 'password')
    @uploaded_file = Shrine.uploaded_file(
      'id' => '12c3c9721d97ffe32bf825152781f2ee.png',
      'storage' => 'store',
      'metadata' => {
        'filename' => 'transport.png',
        'size' => 1572,
        'mime_type' => 'image/png'
      }
    )
  end

  it 'is valid with name and icon' do
    @user.categories.create(name: 'Bills', image: @uploaded_file)
    expect(Category.last).to be_valid
  end

  it 'is not valid without name' do
    category = @user.categories.create(name: '', image: @uploaded_file)
    expect(category).not_to be_valid
  end

  it 'is not valid without image_data' do
    category = @user.categories.create(name: 'Bills', image: nil)
    expect(category).not_to be_valid
  end
end
