class FiguresController < ApplicationController

  get '/figures/new' do
    erb :"figures/new"
  end



  get '/figures' do
    erb :"figures/index"
  end

  get '/figures/:id' do
    @figure= Figure.find_by_id(params[:id])
#    binding.pry
    erb :"figures/show"
  end



  get '/figures/:id/edit' do
    @figure= Figure.find_by_id(params[:id])
    erb :"figures/edit"
  end

  post '/figures' do
    #binding.pry
    @figure = Figure.new(params[:figure])
    @figure.titles.build(name: params[:title][:name]) unless params[:title][:name].empty?
    @figure.landmarks.build(name: params[:landmark][:name]) unless params[:landmark][:name].empty?
    @figure.save
    erb :"/figures/show"
  end


  patch '/figures/:id' do
  #  binding.pry
  @figure = Figure.find_by_id(params[:id])
  @figure.update(params[:figure])

  @figure.titles.build(name: params[:title][:name]) unless params[:title][:name].empty?
  @figure.titles.build(name: params[:landmark][:name]) unless params[:landmark][:name].empty?

#  @figure.titles.clear  if params[:figure][:title_ids].nil?
#  @figure.landmarks.clear  if params[:figure][:landmark_ids].nil?
  @figure.save
#  binding.pry
  redirect "/figures/#{@figure.id}"
  end


end
