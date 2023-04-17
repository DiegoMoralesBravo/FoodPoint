class Item < ApplicationRecord
    has_one_attached :image
    attr_accessor :average
    attr_accessor :sales
end
