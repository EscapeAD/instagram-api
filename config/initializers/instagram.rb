Instagram.configure do |config|
  config.client_id = ENV["client_id"]
  config.client_secret = ENV["client_secret"]
  # For secured endpoints only
  #config.client_ips = '<Comma separated list of IPs>'
end
