class User < ActiveRecord::Base
    has_secure_password

    # Relationships
    has_many :clients
    has_many :jobs, through: :clients
    has_many :services

    # Validation
    validates :username, :email, presence: true
    validates_uniqueness_of :username   # Only one user can have this username
end
