class ItemModel < ActiveRecord::Base
    has_many :characteristics
    belongs_to :item_category
end