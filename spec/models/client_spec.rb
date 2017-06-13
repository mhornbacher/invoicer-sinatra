require 'spec_helper'

describe Client do

    before do
        @user = User.create(username: "user1", password: "test", email: "not.real@world.com")
        @service1 = Service.create(name: "Web Development", price: 500)
        @service2 = Service.create(name: "Fix Server", price: 250)
        @client = Client.create(name: "client1", email: "client@clients.net", phone_number: "347 - 756 (8976)")
    end
    
    it 'validates that it has a name' do
        expect(Client.new).to_not be_valid
        expect(Client.new(name: "Sam")).to be_valid
    end

    it 'has a email' do
        client = Client.new(name: "Sam", email:"test@gmail.com")
        expect(client.email).to eq("test@gmail.com")
    end

    it 'has a phone number' do
        client = Client.new(name: "Sam", phone_number:"156 789 2345")
        expect(client.phone_number).to eq("156 789 2345")
    end

    it 'has many jobs and jobs have a client' do
        client = Client.create(name: "tmp")
        job = Job.create(date: Time.now, amount_paid: 150)
        client.jobs << job
        client.jobs.create(date: Time.now, amount_paid: 50)

        expect(client.jobs.count).to eq(2)
        expect(Job.count).to eq(2)
        expect(client.jobs.first).to eq(job)
        expect(client.jobs.first.client).to eq(client)
    end

    it 'has a user' do
        @client.user = @user
        @client.save

        expect(@client.user.username).to eq("user1")
        expect(@user.clients).to include
    end

    it 'can calculate its balance dynamically' do 
        job = @client.jobs.create(date: Time.now, amount_paid: 50)
        job.services << @service1
        job.services << @service2

        expect(@client.balance).to eq(700)
        expect{job.update(amount_paid: 100)}.to change{@client.balance}.by(-50)
    end
    
    it 'can calculate its total value' do
        job = @client.jobs.create(date: Time.now, amount_paid: 100)
        job.services << @service1

        expect(@client.total).to eq(500)

        expect{job.services << @service2}.to change{@client.total}.by(250)
    end
    
    it 'can calculate its total payments accross all jobs' do
        job = @client.jobs.create(date: Time.now, amount_paid: 100)
        job.services << @service1

        expect(@client.total_paid).to eq(100)

        expect{job.update(amount_paid: 150)}.to change{@client.total_paid}.by(50)
    end
end

    