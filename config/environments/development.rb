Jets.application.configure do
  # Docs: https://rubyonjets.com/docs/config/reference/

  config.cache_classes = false
  config.eager_load = false
  config.logging.event = false # can be useful for CloudWatch

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable server timing
  config.server_timing = true

  # Enable/disable caching. By default caching is disabled.
  if Jets.root.join("tmp/caching-dev.txt").exist?
    config.jets_controller.perform_caching = true
    config.cache_store = :memory_store
  else
    config.jets_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # Docs: http://rubyonjets.com/docs/email-sending/
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  # config.action_mailer.default_url_options = { host: 'localhost', port: 8888 }
end
