class Book < ApplicationRecord
    validates :title, presence: true
    validates :author, presence: true
    validates :status, presence: true
    validates :name, presence: true
    validates :name, presence: true
    enum status: %w[House Outside]
end
