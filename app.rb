require "sinatra"
require_relative "./get_links"

get "/getlinks" do
  url = params["link_input"]
    if url
      get_links = GetLinks.new
      result = get_links.find_twitter(url)
    else
      result = []
    end
  erb :index, :locals => { :result => result }
end
