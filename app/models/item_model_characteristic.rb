class ItemModelCharacteristic < ActiveRecord::Base
    belongs_to :item_model
    belongs_to :characteristic
    has_many :ratings

    def self.from_parent(item_model: :item_model, characteristic: :characteristic)
        item_model_char = self.find_or_create_by(item_model_id: item_model.id, characteristic_id: characteristic.id)
    end

    def average_rating
        if !self.ratings.empty?
            overall_rating = self.ratings.collect {|rating| rating.rating}

            (overall_rating.inject(0.0){|sum, num| sum + num}/overall_rating.size).round(2)
        else
            overall_rating = "No Ratings"
        end
    end

    def review_count
        self.ratings.size
    end
end