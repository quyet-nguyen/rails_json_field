module RailsJsonField
  module Rails
    module FormBuilder
      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::FormTagHelper
      include ActionView::Helpers::JavaScriptHelper
      include ActionView::Context

      def json_field(method, options = {})
        object_json = @object.nil? ? {} : (@object.send(method) || {})
        id = SecureRandom.uuid

        content_tag :div, id: id do
          concat(javascript_tag("railsJsonField('#{id}', '#{@object_name}', '#{method}', #{object_json.to_json})"))
        end
      end
    end
  end
end

RailsJsonField::FormBuilder = RailsJsonField::Rails::FormBuilder
