require 'spec_helper'

describe User do

    let(:user_hash) {{username: "duplicate", email: "test@test.com", password: "tmp"}}

    it 'has a username, email and password and validates that they exists' do
        expect(User.new).to_not be_valid
        expect(User.new(username: "test")).to_not be_valid
        expect(User.new(username: "test", password: "test")).to_not be_valid
        expect(User.new(password: "test", email: "tmp")).to_not be_valid
        expect(User.new(username: "test", password: "test", email: "test@test.com")).to be_valid
    end

    it 'validates that that username is unique' do
        user1 = User.create(user_hash)
        expect(User.new(user_hash)).to_not be_valid
        # user1.destroy
    end

    it 'has secure password' do
        user = User.new(password: "test")
        expect(user.authenticate("not_good")).to eq(false)
        expect(user.authenticate("test")).to eq(user)
    end
    
    it 'has many clients' do
        user = User.create(user_hash)
        client1 = user.clients.create(name: "client1")
        client2 = user.clients.create(name: "client2")
        
        expect(user.clients.count).to eq(2)
        expect(user.clients).to include(client1)
        expect(Client.last.user).to eq(user)

        # user.destroy
    end
    
    it 'has many jobs through clients' do
        user = User.create(user_hash)
        client1 = user.clients.create(name: "client1")
        client2 = user.clients.create(name: "client2")

        job1 = client1.jobs.create(date: Time.now, amount_paid: 50)
        job2 = client1.jobs.create(date: Time.now, amount_paid: 600)
        job3 = client2.jobs.create(date: Time.now, amount_paid: 80)

        expect(user.jobs.count).to eq(3)
        expect(user.jobs).to include(job1)
        expect(user.jobs).to include(job2)
        expect(user.jobs).to include(job3)

        # user.destroy
    end
    
    it 'has many services' do
        user = User.create(user_hash)
        user.services.create(name: "Web Developer", price: 500)
        service2 = user.services.create(name: "PHP code", price: 1200)

        expect(user.services.count).to eq(2)
        expect(user.services).to include(service2)
        # user.destroy
    end
    
end
