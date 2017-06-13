require 'spec_helper'

describe User do

    it 'has a username, email and password and validates that they exists' do
        expect(User.new).to_not be_valid
        expect(User.new(username: "test")).to_not be_valid
        expect(User.new(username: "test", password: "test")).to_not be_valid
        expect(User.new(password: "test", email: "tmp")).to_not be_valid
        expect(User.new(username: "test", password: "test", email: "test@test.com")).to be_valid
    end

    it 'validates that that username is unique' do
        user_hash = {username: "duplicate", email: "test@test.com", password: "tmp"}
        user1 = User.create(user_hash)
        expect(User.new(user_hash)).to_not be_valid
    end

    it 'has secure password' do
        user = User.new(password: "test")
        expect(user.authenticate("not_good")).to eq(false)
        expect(user.authenticate("test")).to eq(user)
    end
    
    it 'has many clients' do
    end
    
    it 'has many jobs through clients' do
    end
    
    it 'has many services' do
    end
    
end
