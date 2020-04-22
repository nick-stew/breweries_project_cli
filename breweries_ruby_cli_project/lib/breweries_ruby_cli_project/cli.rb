class BreweriesRubyCliProject::CLI

    def call
        puts "Hello! Lets find you a Brewery!"
        main_action
        second_question
        return_to_start
    end

    def main_action
        all = []
        puts "Please enter the state you would like to find a Brewery in. (enter the full state name)".green
       

        input = gets.strip
        
        if input == "exit"
            puts "Thanks for stoping by!".light_green
            exit
        end

         all = BreweriesRubyCliProject::APIService.query_openbrewerydb(input)

         BreweriesRubyCliProject::Brewery.all.each.with_index(1) do |b, i|
            puts "#{i}. #{b.name}".blue
        end

        if all == []
            puts "No Breweries were found. Check to ensure you have the correct state spelling".red
            call
        end

    end

    def second_question
        all = []

        puts "Enter the number of the Brewery you would like to learn more about.".green

        input = gets.strip

        if input == "exit"
            puts "Thanks for stoping by!".light_green
            exit
        end

        if !input.to_i.between?(1,BreweriesRubyCliProject::Brewery.all.length)
            puts "Check the number and confirm it matches a brewery".red
            second_question
        else 
            brewery =  BreweriesRubyCliProject::Brewery.all[input.to_i - 1]
            all = BreweriesRubyCliProject::APIService.query_single_brewery(brewery)
    
           all.each.with_index(1) do |b, i|
                puts "#{i}. #{b.join(" - ")}".blue
            end
        end

    end

    def return_to_start
        puts "would you like to search again? enter yes or no".light_green
        input = gets.strip

       if input == "no"

           puts "Thanks for stoping by! Drink Responsible.".light_green

           exit

       else
        BreweriesRubyCliProject::Brewery.all.clear
        call
     
    end
end



end