require 'rails_helper'

RSpec.describe Entity, type: :model do
  it 'is valid with name' do
    user = User.create(name: 'Roy Batty', email: 'roy@batty.com', password: 'password')
    entity = Entity.create(author_id: user.id, name: 'Electricity', amount: 100.5)
    expect(entity).to be_valid
  end


  it 'is not valid without name' do
    user = User.create(name: 'Roy Batty', email: 'roy@batty.com', password: 'password')
    entity = Entity.create(author_id: user.id, name: '', amount: 100.5)
    expect(entity).not_to be_valid
  end

  it 'is not valid without amount' do
    user = User.create(name: 'Roy Batty', email: 'roy@batty.com', password: 'password')
    entity = Entity.create(author_id: user.id, name: 'Electricity')
    expect(entity).not_to be_valid
  end

  it 'is not valid when amount is less than 0 ' do
    user = User.create(name: 'Roy Batty', email: 'roy@batty.com', password: 'password')
    entity = Entity.create(author_id: user.id, name: 'Electricity', amount: -10 )
    expect(entity).not_to be_valid
  end

  it 'is valid when amount is greather than zero' do
    user = User.create(name: 'Roy Batty', email: 'roy@batty.com', password: 'password')
    entity = Entity.create(author_id: user.id, name: 'Electricity', amount: 100.5)
    expect(entity).to be_valid
  end
end
