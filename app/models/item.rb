class Item < ApplicationRecord
    has_one_attached :image
    attr_accessor :average
    attr_accessor :sales
    attr_accessor :available_qty
end
