require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with name, email and password' do
    user = User.create(name: 'Roy Batty', email: 'roy@batty.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is not valid without name' do
    user = User.create(name: '', email: 'roy@batty.com', password: 'password')
    expect(user).not_to be_valid
  end

  it 'is not valid without email ' do
    user = User.create(name: 'Roy Batty', email: '', password: 'password')
    expect(user).not_to be_valid
  end

  it 'is not valid without password' do
    user = User.create(name: 'Roy Batty', email: '', password: 'password')
    expect(user).not_to be_valid
  end
end
