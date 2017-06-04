class Client < ActiveRecord::Base
    belongs_to :user
    has_many :jobs

    validates :name, :email, presence: true
end
