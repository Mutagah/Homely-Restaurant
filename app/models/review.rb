class Review < ApplicationRecord
    belongs_to :restaurant
    validates :title, presence: true
    validates:comment, presence: true
end
