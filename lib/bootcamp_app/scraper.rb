require 'pry'
class BootcampApp::Scraper #class responsible for all scraping logic

def self.scrape
        doc = Nokogiri::HTML(open("https://www.coursereport.com/best-coding-bootcamps"))

        doc.css("div.info-container").map do |ranking|
        name = ranking.css("h3").children[0].text.gsub(/\d+/,"").delete(" . ").gsub(/(?<=[A-Za-z])(?=[A-Z])/, ' ')
        locations = ranking.css(".location").text
        overall_rating = ranking.css(".longform-rating-text").children[0].text
        info = ranking.css(".desc-container").css("p").children[0].text
        url_link = ranking.css("h3").css("a").attr('href')
        BootcampApp::Bootcamp.new(name, locations, overall_rating, url_link, info)


    end
end


end
