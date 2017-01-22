require "sinatra"
require_relative "./get_links"

get "/getlinks" do
  get_links = GetLinks.new
  result = get_links.find_twitter(params["link_input"])
  erb index, :locals => { :result => result }
end
