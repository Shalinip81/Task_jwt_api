class ArticlesController < ApplicationController

  def index
    @articles=Article.all
    # render json: Article.all, each_serializer: UserSerializer
    render json: UserSerializer.new(@articles).serializable_hash
  end
end
