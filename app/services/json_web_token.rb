module JsonWebToken
  SECRET_KEY = SECRET_KEY = Rails.application.secret_key_base

  def self.encode(payload, exp = 2.minutes.from_now.to_i) #Tempo de expiração do token
    payload[:exp] = exp
    JWT.encode(payload, SECRET_KEY) 
  end

  def self.decode(token)
    JWT.decode(token, SECRET_KEY).first
  rescue JWT::ExpiredSignature
    {error: "Auth token has expired."}
  rescue JWT::DecodeError
    {error: "Invalid auth token."}
  end
end