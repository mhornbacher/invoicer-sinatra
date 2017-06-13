require 'spec_helper'

describe Job do
    let(:job){Job.new(date: Time.now, amount_paid: 50)}
    before do
        @user = User.create(username: "user1", password: "test", email: "fake.email@spam.net")
        @service1 = Service.create(name: "Web Development", price: 500)
        @service2 = Service.create(name: "Fix Server", price: 250)
        @client = Client.create(name: "client1", email: "client@clients.net", phone_number: "347 - 756 (8976)")
    end

    # clear the database
    after do
        User.destroy_all
        Service.destroy_all
        Job.destroy_all
        Client.destroy_all
    end

    it 'validates that it has a date and amount paid' do
        expect(Job.new).to_not be_valid
        expect(Job.new(date: Time.now)).to_not be_valid
        expect(Job.new(amount_paid: 50)).to_not be_valid
        expect(Job.new(date: Time.now, amount_paid: 50)).to be_valid
    end
    
    it 'can calculate its total price' do
        job.services << @service1
        job.services << @service2

        expect(job.total_price).to eq(750)
    end

    it 'can calculate its balance' do
        job.services << @service2

        expect(job.balance).to eq(200)
    end
    
end
