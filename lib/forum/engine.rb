module Forum
  class Engine < ::Rails::Engine
    isolate_namespace Forum

    # Enabling assets precompiling under rails 3.1
    if Rails.version >= '3.1'
      initializer :assets do |config|
        Rails.application.config.assets.precompile += %w( forum/* )
      end
    end
  end
end
