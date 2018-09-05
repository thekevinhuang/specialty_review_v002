class ItemModelCharacteristic < ActiveRecord::Base
    belongs_to :item_model
    belongs_to :characteristic
    has_many :ratings
end