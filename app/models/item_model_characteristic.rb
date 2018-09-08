class ItemModelCharacteristic < ActiveRecord::Base
    belongs_to :item_model
    belongs_to :characteristic
    has_many :ratings

    def self.from_parent(item_model: :item_model, characteristic: :characteristic)
        item_model_char = self.find_or_create_by(item_model_id: item_model.id, characteristic_id: characteristic.id)
    end
end