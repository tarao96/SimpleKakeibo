class Variablecost < ApplicationRecord
    has_many :variablecost_values, dependent: :destroy
    validates :name, presence: true
end
