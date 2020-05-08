require 'pry'

class BootcampApp::Bootcamp #class responsible for all bootcamps

   #class variable to store all new instances

    attr_accessor :name, :locations, :overall_rating, :url_link, :info

    @@all = []

    #attributes assigned upon initialization
    def initialize(name,locations,overall_rating,url_link)
        @name = name
        @locations = locations
        @overall_rating = overall_rating
        @url_link = url_link
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_index(index)
        @@all[index]
    end

#     def self.logo
#         puts"
#         _______ _
#        |__   __| |
#           | |  | |__   ___
#           | |  | '_ \ / _ \
#           | |  | | | |  __/
#          _____ |_| |_|\____
#         / ____|        | (_)
#        | |     ___   __| |_ _ __   __ _
#        | |    / _ \ / _` | | '_ \ / _` |
#        | |___| (_) | (_| | | | | | (_| |
#         ______\___/ \__,_|_|_| |_|\__, |
#        |  _ \            | |       __/ |
#        | |_) | ___   ___ | |_ ___ ____/_ __ ___  _ __
#        |  _ < / _ \ / _ \| __/ __/ _` | '_ ` _ \| '_ \
#        | |_) | (_) | (_) | || (_| (_| | | | | | | |_) |
#        |___/\ \___/ \___/ \__\___\__,_|_| |_| |_| .__/
#           /  \   _ __  _ __                     | |
#          / /\ \ | '_ \| '_ \                    |_|
#         / ____ \| |_) | |_) |
#        /_/    \_| .__/| .__/
#                 | |   | |
#                 |_|   |_|
#   Course Report's Best Coding Bootcamp Ranking".blue.bold
#     end





end
