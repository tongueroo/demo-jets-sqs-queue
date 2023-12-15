module Demo
  class Application < Jets::Application
    config.load_defaults 5.0

    config.project_name = "demo"
    config.mode = "html"

    # Docs:
    # https://rubyonjets.com/docs/config/
    # https://rubyonjets.com/docs/config/reference/
  end
end
