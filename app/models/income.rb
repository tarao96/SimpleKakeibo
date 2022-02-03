class Income < ApplicationRecord
    has_many :income_values, dependent: :destroy
    validates :name, presence: true
end
