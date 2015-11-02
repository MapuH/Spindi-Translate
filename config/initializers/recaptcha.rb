Recaptcha.configure do |config|
  if Rails.env.development? or Rails.env.test?
    config.public_key  = Rails.application.secrets.recaptcha_public_key
    config.private_key = Rails.application.secrets.recaptcha_secret_key
  else
    config.public_key = ENV['RECAPTCHA_PUBLIC_KEY']
    config.private_key = ENV['RECAPTCHA_PRIVATE_KEY']
  end
  config.api_version = 'v2'
end