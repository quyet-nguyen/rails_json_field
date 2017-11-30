require 'action_view/helpers'
require 'rails_json_field/rails/form_builder'

module RailsJsonField
  module Rails
    module FormHelper
      def self.included(_base)
        ActionView::Helpers::FormBuilder.instance_eval do
          include FormBuilder
        end
      end
    end
  end
end

ActionView::Base.send :include, RailsJsonField::Rails::FormHelper
