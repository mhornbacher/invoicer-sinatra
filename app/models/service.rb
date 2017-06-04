class Service < ActiveRecord::Base
    belongs_to :user
    has_many :job_services
    has_many :jobs, through: :job_services

    validates :title, :price, presence: true
end
