class ItemModel < ActiveRecord::Base
    has_many :item_model_characteristics
    has_many :characteristics, through: :item_model_characteristics
    belongs_to :item_category

    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
end