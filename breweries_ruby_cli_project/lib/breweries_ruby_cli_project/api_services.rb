class BreweriesRubyCliProject::APIService
    BASE_URL= 'https://api.openbrewerydb.org/breweries'

    def self.query_openbrewerydb(query)
        results = RestClient.get("#{BASE_URL}?by_state=#{query}"
        json = JSON.parse(results) 
        json.each do |brewery_hash|
            BreweriesRubyCliProject::Brewery.new(brewery_hash)
       end
   end 

   def self.query_single_brewery(brewery)
    results = RestClient.get("#{BASE_URL}/#{brewery.id}")


    json = JSON.parse(results)
     brewery.update(json)


end

end
