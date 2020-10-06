require_relative 'config/environment'
#gives us the ability to reference the 
#TextAnalyzer class and invoke its new method
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]
    #take the data from params[:user_text] (in the post '/' do route) 
    #and feed it into a new instance of the TextAnalyzer clas
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    erb :results
  end
end
