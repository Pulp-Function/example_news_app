class Api::ArticlesController < ApplicationController
  def index
    response = HTTP.get("https://newsapi.org/v2/everything?q=#{params[:search]}&apiKey=#{Rails.application.credentials.news_api[:api_key]}")
    articles = response.parse["articles"]
    render json: { articles: articles }
  end
end
