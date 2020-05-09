require 'pry'
class BootcampApp::Scraper #class responsible for all scraping logic

def self.scrape
        doc = Nokogiri::HTML(open("https://www.coursereport.com/best-coding-bootcamps"))


        doc.css("div.info-container").map do |bootcamp|
            name = bootcamp.css("h3").children[0].text.gsub(/\d+/,"").delete(" . ").gsub(/(?<=[A-Za-z])(?=[A-Z])/, ' ')
            locations = bootcamp.css(".location").text
            overall_rating = bootcamp.css(".longform-rating-text").children[0].text
            about = bootcamp.css(".desc-container").css("p").children[0].text
            url_link = bootcamp.css("h3").css("a").attr('href')
            BootcampApp::Bootcamp.new(name, locations, overall_rating, url_link, about)
        end
    end
end

#     def self.scrape_two(bootcamp)
#         base_url = "https://www.coursereport.com"
#         doc = open("#{base_url}" + "#{bootcamp.url_link}")
#         html_elements = Nokogiri::HTML(doc)
#            bootcamp.info = html_elements.css("about").css(".read-more").css("p").text
#            bootcamp.review = html_elements.css(".review course-card").css("content").css("div").text
#     end
