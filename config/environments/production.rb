Jets.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.log_level = :info
  config.logging.event = false # can be useful for CloudWatch

  config.consider_all_requests_local       = false
  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # Docs: http://rubyonjets.com/docs/email-sending/
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_caching = false
  # config.action_mailer.default_url_options = { host: 'localhost', port: 8888 }
end
