require 'pry'

class BootcampApp::Bootcamp #class responsible for all bootcamps

    attr_accessor :name, :locations, :overall_rating, :url_link, :about #:review

    @@all = []

    #attributes assigned upon initialization
    def initialize(name,locations,overall_rating,url_link,about)
        @name = name
        @locations = locations
        @overall_rating = overall_rating
        @url_link = url_link
        @about = about
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_index(index)
        @@all[index]
    end


end
