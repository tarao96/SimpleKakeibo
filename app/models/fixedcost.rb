class Fixedcost < ApplicationRecord
    has_many :fixedcost_values, dependent: :destroy
    validates :name, presence: true
end
