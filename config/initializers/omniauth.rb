OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '426669610763003', '789e6f59834dcd6a274e23de52bb2717'
end
