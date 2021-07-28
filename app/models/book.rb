class Book < ApplicationRecord
    validates :title, presence: true
    validates :author, presence: true
    validates :status, presence: true
    enum status: %w[House Outside]

    validate :valid_dates

    def valid_dates
        if lending_date != nil || return_date != nil 
            if lending_date > return_date 
                self.errors.add :return_date, 'must be after than lending date.'
            end
        end
    end
end
