module OvercWrench
  module Rails
    class Engine < ::Rails::Engine
      initializer "overc_wrench.setup_helpers" do |app|
        app.config.to_prepare do
          ActionController::Base.send :helper, OvercWrenchHelpers
        end
      end
    end
  end
end
