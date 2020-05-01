require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do

        erb :super_hero
    end

    post '/teams' do
        @team = Team.new
        @team.name = params[:team][:name]
        @team.motto = params[:team][:motto]

        heroes = params[:team][:member]
        heroes.each do |hero_data|
            hero = Superhero.new(hero_data)
        end
        erb :team
    end

end