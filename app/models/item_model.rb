class ItemModel < ActiveRecord::Base
    has_many :characteristics
    belongs_to :item_category

    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
end