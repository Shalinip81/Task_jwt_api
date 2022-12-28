class ApplicationController < ActionController::API

  def validate_json_web_token
    begin
      # byebug
      decode = JwtToken.jwt_decode(params[:token])
      @user = User.find_by_id(decode["id"])
    rescue JWT::ExpiredSignature
      render json: {error: 'Token has expired'}
    end
  end

end
