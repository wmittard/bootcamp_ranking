require 'pry'

class BootcampApp::Bootcamp #class responsible for all bootcamps

   #class variable to store all new instances

    attr_accessor :name, :locations, :overall_rating, :info, :url_link

    @@all = []

    #attributes assigned upon initialization
    def initialize(name,locations,overall_rating,info,url_link)
        @name = name
        @locations = locations
        @overall_rating = overall_rating
        @info = info
        @url_link = url_link
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_index(index)
        @@all[index]
    end





end
