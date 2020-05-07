
class BootcampApp::Scraper#class responsible for all scraping logic

def self.scrape
        doc = Nokogiri::HTML(open("https://www.coursereport.com/best-coding-bootcamps")) #parses info to become readable
         #narrowed down elements with a specific div tagged that my class is housed in

        doc.css("div.info-container").each do |ranking| #iterates over each element to return new instances to class variable
        name = ranking.css("h3").children[0].text.gsub(/\d+/,"").delete(" . ")
        locations = ranking.css(".location").text #call each css selector and save to each variable
        overall_rating = ranking.css(".longform-rating-text").children[0].text
        info = ranking.css(".desc-container").css("p").children[0].text
        url_link = ranking.css(".longform-review-container").css("p").text
        BootcampApp::Bootcamp.new(name, locations, overall_rating, info, url_link)
        #make a new instance out of bootcamp, which will go into @@all, [] and we will use that array later
        #binding.pry
    end
end

end
