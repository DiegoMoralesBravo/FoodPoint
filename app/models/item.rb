class Item < ApplicationRecord
    has_one_attached :image
    attr_accessor :average
end
