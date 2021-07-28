class Book < ApplicationRecord
    enum status: %w[House Outside]
end
