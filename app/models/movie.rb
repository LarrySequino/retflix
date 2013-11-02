class Movie < ActiveRecord::Base
    #get the current year
    current_year = Time.new.year
    
    validates :title, presence: true
    validates :description, presence: true
    validates :year_released, numericality: true
    validates :year_released, inclusion: {in: 1888..current_year}
end
