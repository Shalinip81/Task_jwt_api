require "jwt"

module JwtToken

  extend ActiveSupport::Concern
  SECRET_KEY =Rails.application.secrets.secret_key_base.to_s

  def self.jwt_encode(payload, exp:50.minutes.from_now.to_i)
    exp_payload = { id: payload, exp: exp }
    JWT.encode(exp_payload, SECRET_KEY)
  end

  def self.jwt_decode(token)
    JWT.decode(token, SECRET_KEY, true)[0]
  end
end
