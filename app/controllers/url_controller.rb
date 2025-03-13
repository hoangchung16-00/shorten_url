class UrlController < ApplicationController
  def encode
    short_url = UrlService.shorten(params[:url], request.host_with_port)
    render json: { short_url: short_url }
  end

  def decode
    url = UrlService.expand(params[:short_url])
    render json: { url: }
  end
end
