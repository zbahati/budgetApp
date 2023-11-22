require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with name and icon' do
    @user = User.create(name: 'Roy Batty', email: 'roy@batty.com', password: 'password')
    category = @user.categories.create(name: 'Bills', icon: 'image.jpg')
    expect(category).to be_valid
  end

  it 'is not valid without name' do
    @user = User.create(name: 'Roy Batty', email: 'roy@batty.com', password: 'password')
    category = @user.categories.create(name: '', icon: 'image.jpg')
    expect(category).not_to be_valid
  end

  it 'is not valid without icon' do
    @user = User.create(name: 'Roy Batty', email: 'roy@batty.com', password: 'password')
    category = @user.categories.create(name: 'Bills', icon: '')
    expect(category).not_to be_valid
  end
end