require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :'super_hero'
    end

    post '/teams' do
        @team_name = params["team"]["name"]
        @team_motto = params["team"]["motto"]
        @team_members = params["team"]["members"]
        @hero_names = []
        @hero_powers = []
        @hero_bios = []
        @team_members.each do |member|
            @hero_names << member["name"]
            @hero_powers << member["power"]
            @hero_bios << member["bio"]
        end

        erb :'team'
    end

end