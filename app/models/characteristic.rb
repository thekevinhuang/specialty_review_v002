class Characteristic <ActiveRecord::Base
    
    has_many :ratings
    belongs_to :item_model

    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
end