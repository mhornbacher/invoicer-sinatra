class Job < ActiveRecord::Base
    belongs_to :client
    has_many :job_services
    has_many :services, through: :job_services

    validates :date, :amount_paid, presence: true

    def total_price
        self.services.inject(0){|sum, service| sum + service.price }
    end
    def balance
        self.total_price - self.amount_paid
    end
end
