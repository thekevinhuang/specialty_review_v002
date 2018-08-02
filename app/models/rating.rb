class Rating <ActiveRecord::Base
    validates :rating, presence: true, inclusion: 1..5
    belongs_to :user
    belongs_to :characteristic
end