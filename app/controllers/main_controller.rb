class MainController < ApplicationController
  def index
    @selected_category = (params[:category].blank? ? "all" : params[:category])
    @selected_site = (params[:site].blank? ? "-" : params[:site])
    @menu = JSON.parse( '{"categories": [ {"name": "all", "sites": ["-"]},   {"name": "animes", "sites": ["Anbient", "Anitube"]},  {"name": "quadrinhos","sites": ["Vida de Programador", "Vida de Suporte", "Um Sábado Qualquer"]} ,  {"name": "blogs","sites": ["Minilua"]} ]}');



    url_anbient = "http://www.anbient.net/rss.xml"
    url_anitube = "http://feeds.feedburner.com/Anitube?format=xml"
    
    url_vida_de_programador = "http://feeds.feedburner.com/VidaDeProgramador?format=xml"
    url_vida_de_suporte = "feeds.feedburner.com/vidasuporte?format=xml"
    url_um_sabado_qualquer = "http://feeds.feedburner.com/umsabadoqualquer/olOP?format=xml"
    
    url_minilua = "http://feeds2.feedburner.com/Minilua"



    case @selected_category
    when "animes"
      case @selected_site
      when "Anbient"
        urls = [url_anbient]
      when "Anitube"
        urls = [url_anitube]
      when "-"
        urls = [url_anbient, url_anitube]
      end
    when "quadrinhos"
      case @selected_site
      when "Vida de Programador"
        urls = [url_vida_de_programador]
      when "Vida de Suporte"
        urls = [url_vida_de_suporte]
      when "Um Sábado Qualquer"
        urls = [url_um_sabado_qualquer]
      when "-"
        urls = [url_vida_de_programador, url_vida_de_suporte, url_um_sabado_qualquer]
      end
    when "blogs"
      case @selected_site
      when "Minilua"
        urls = [url_minilua]
      when "-"
        urls = [url_minilua]
      end
    when "all"
      urls = [url_anbient, url_anitube, url_vida_de_programador, url_vida_de_suporte, url_um_sabado_qualquer, url_minilua]
    end

    feeds = Feedjira::Feed.fetch_and_parse urls
    @feeds = Array.new
    urls.each do |url|
      @feeds.push(feeds[url])
    end
    
    
    # urls = %w[http://feedjira.com/blog/feed.xml https://github.com/feedjira/feedjira/feed.xml]
    # feeds = Feedjira::Feed.fetch_and_parse urls # returns a Hash, with each url having a Feedjira::Feed object
    # # => {
    # #      'http://feedjira.com/blog/feed.xml' => <Feedjira::Feed ..>,
    # #      'https://github.com/feedjira/feedjira/feed.xml' => <Feedjira::Feed ..>
    # #    }
# 
    # @feeds = feeds['http://feedjira.com/blog/feed.xml']
  end
end
