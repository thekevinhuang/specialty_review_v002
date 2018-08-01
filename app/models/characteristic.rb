class Characteristic <ActiveRecord::Base
    has_many :ratings
    belongs_to :item_model
end