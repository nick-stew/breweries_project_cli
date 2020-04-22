class BreweriesRubyCliProject::Brewery 
    
    attr_accessor :id, :name, :brewery_type, :street, :city, :state, :postal_code, :country, :longitude, :latitude, :phone, :website_url
    @@all = []
    def initialize(args)
        update(args)
        @@all << self
    end

    def update(args)
        args.each do |k,v|
            self.send("#{k}=", v) if self.respond_to?(k)
        end
    end

    def self.all
        @@all
    end

end