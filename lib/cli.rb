class Cli
    def start 
       puts "Shalom!"
       Api.get_data
       check_date_options
    end

def check_date_options
    puts "Curious when to light your candles for Shabbos? Type 'Dates' too see when to light!"
    check_date
end

    def check_date 
        input = get_input

            if input == "Dates"
                list_dates
            else 
                invalid_date 
                check_date_options 
            end
    end

    def get_input
        gets.chomp
      end 

    def invalid_date
        puts "Invalid enry. Try again!"
    end

    def list_dates
          CandleLighting.all.each_with_index do |title, index|
            puts "#{index}. #{title.date}"
        end

        lighting_times_info_list
    end
    
  def lighting_times_info_list
        puts "Select the date to view the lighting time!" 
        lighting_times_info
    end

def lighting_times_info
    input = get_input
        
    if input.to_i.between?(0, 60)

        index = input.to_i 
        date = CandleLighting.all[index]
        print_lighting_time(date)
    else
        invalid_date
        lighting_times_info_list

    end
end



def print_lighting_time(date)
    puts "~~~#{date.title}~~~
    
Don't forget the barakhot:
בָּרוּך אַתָּה ה׳ אֱלֹהֵינוּ מֶלֶך הָעוֹלָם אַשֶׁר קִדְשָׁנוּ בְּמִצְוֹתָיו וְצִוָנוּ לְהַדְלִיק נֵר שֶל שַבָּת

Baruch ata Adonai, Eloheinu Melech ha-olam, asher kidshanu b’mitzvotav vitzivanu l’hadlik ner shel Shabbat.

Blessed are You, God, Ruler of the universe, who sanctified us with the commandment of lighting Shabbat candles.

Good Shabbos!"
end 
end
     