class ItemCategory < ActiveRecord::Base
    has_many :item_models
    has_many :characteristics, through: :item_models
    belongs_to :activity
end