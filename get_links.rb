require "open-uri"
require "nokogiri"
require "uri"

# doc = Nokogiri::HTML(open("https://www.youtube.com"))

# puts doc
class GetLinks
  def find_twitter(url)
    doc = Nokogiri::HTML(open(url).read)
    links = doc.css("a").map do |a|
      URI.parse(a[:href])
    end

    links.select do |u|
      u.hostname and u.hostname.end_with?("twitter.com")
    end
  end
end
# puts find_twitter("http://pinglinh.com/")
