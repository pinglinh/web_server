require "open-uri"
require "nokogiri"
require "uri"

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
