class Book < ApplicationRecord
    validates :title, presence: true
    validates :author, presence: true
    validates :status, presence: true
    enum status: %w[House Outside]

    validate :valid_dates

    def valid_dates
        if lending_date != nil && return_date != nil 
            if lending_date > return_date 
                self.errors.add :return_date, 'must be after than lending date.'
            end
        end
    end

    validate :where_is

    def where_is
        if status == 'Outside'
            if lending_date.blank? || return_date.blank?
                self.errors.add :lending_date, "must be included."
                self.errors.add :return_date, "must be included."
            end
        elsif status == 'House'
            if lending_date.present? || return_date.present? 
                self.errors.add :lending_date, "need to be blank."
                self.errors.add :return_date, "need to be blank."
            end
        end
    end
end
