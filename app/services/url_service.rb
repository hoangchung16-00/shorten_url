class UrlService
  def self.shorten(url, host)
    short_url = ShortUrl.create!(url:)
    build_url(short_url.slug, host)
  end

  def self.expand(short_url)
    url = ShortUrl.find_by!(slug: URI.parse(short_url).path[1..-1])&.url
  end

  def self.build_url(url, host)
    "http://#{host}/#{url}"
  end
end
