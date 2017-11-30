module RailsJsonField
  module Rails
    class Engine < ::Rails::Engine
      initializer 'rails_json_field.form_helpers' do |_app|
        ActiveSupport.on_load(:action_view) { require 'rails_json_field/rails/form_helper' }
      end
    end
  end
end
