require 'net/http'

class OEmbed
  ENDPOINTS = {
    vimeo: 'http://vimeo.com/api/oembed.json',
    youtube: 'http://www.youtube.com/oembed',
    dailymotion: 'http://www.dailymotion.com/services/oembed'
  }

  def self.get(url)
    new(url).json
  end

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def json
    JSON.parse(response).with_indifferent_access
  end

private

  def response
    Net::HTTP.get(uri)
  end

  def uri
    URI("#{endpoint}?url=#{url}")
  end

  def endpoint
    ENDPOINTS[provider]
  end

  def provider
    Domainatrix.parse(url).domain.to_sym
  end
end
