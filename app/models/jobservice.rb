class JobService < ActiveRecord::Base
    belongs_to :job
    belongs_to :service
end
