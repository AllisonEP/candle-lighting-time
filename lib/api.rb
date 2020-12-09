class Api
def self.get_data
    load_candlelightings
end

    def self.load_candlelightings
        response = RestClient.get("https://www.hebcal.com/hebcal?v=1&cfg=json&maj=on&min=on&mod=on&nx=on&year=now&month=x&ss=on&mf=on&c=on&geo=geoname&geonameid=5128581&m=50&s=on")
        data = JSON.parse(response.body)
        data["items"].each do |hash|
            CandleLighting.new(hash["title"], hash["date"].split) if hash["title"].include?("Candle lighting")

        end  
    end
end 
