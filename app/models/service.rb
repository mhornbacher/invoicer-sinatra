class User < ActiveRecord::Base
    belongs_to :user
    has_many :jobs through: :job_services
end
