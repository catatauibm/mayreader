class MainController < ApplicationController
  def index
    @menu = JSON.parse( '{"categories": [ {"name": "all", "sites": ["-"]},   {"name": "animes", "sites": ["site 1", "site 2"]},  {"name": "jogos","sites": ["site 3"]} ,  {"name": "blogs","sites": ["site 5","site 6","site 7"]} ]}');
  end
  
  
end
