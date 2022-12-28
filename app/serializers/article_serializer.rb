class ArticleSerializer < ActiveModel::Serializer
  attributes :id ,:name
  attributes :created_time


  def created_time
    object.created_at.strftime("%d-%B-%Y %I:%M %p ")
  end

end



