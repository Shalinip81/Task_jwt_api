class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes:id

  attributes:date do |obj|
    obj.created_at.strftime("%d-%B-%Y %I:%M %p ")
  end

end
