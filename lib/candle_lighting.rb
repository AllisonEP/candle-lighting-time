class CandleLighting

    attr_accessor :title, :date

    @@all = []

    def initialize(title, date)
        @title = title
        @date = date
        @@all << self
    end

    def self.all 
        @@all 
    end
end