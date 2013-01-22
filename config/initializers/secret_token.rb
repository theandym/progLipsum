# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
if Rails.env.production?
  ProgLipsum::Application.config.secret_token = ENV['SECRET_TOKEN']
else
  ProgLipsum::Application.config.secret_token = '69eeb86e37901c932a641b933ec22c2d822258a778408db01386af5f30d3f99d267310012da3742a1edc6c743fc7dfeb0eb608dab4bd860730e6f05765ee9afe'
end
