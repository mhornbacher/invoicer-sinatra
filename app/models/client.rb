class Client < ActiveRecord::Base
    belongs_to :user
    has_many :jobs

    validates :name, presence: true

    def balance
        self.jobs.inject(0){|sum, job| sum + job.balance }
    end
    
    def total
        self.jobs.inject(0){|sum, job| sum + job.total_price }
    end
    
    def total_paid
        self.jobs.inject(0){|sum, job| sum + job.amount_paid }
    end
end
