require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team_name = params[:team][:name]
      @team_motto = params[:team][:motto]
      @hero_name = []
      @hero_power = []
      @hero_bio = []
      @team_heros = params[:team][:heros]
      @team_heros.each do |key|
        @hero_name << key[:name]
        @hero_power << key[:power]
        @hero_bio << key[:bio]
        end
      erb :team
    end

end
