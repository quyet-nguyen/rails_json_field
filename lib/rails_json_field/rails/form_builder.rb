module RailsJsonField
  module Rails
    module FormBuilder
      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::FormTagHelper
      include ActionView::Helpers::JavaScriptHelper
      include ActionView::Context

      def json_field(method, options = {})
        object_json = @object.nil? ? {} : @object.send(method)
        id = SecureRandom.uuid

        content_tag :div, id: id do
          object_json.each do |k, v|
            concat(
              content_tag(:div, class: 'json-field-field') do
                [
                  concat(content_tag(:input, "", type:'hidden', name: "#{@object_name}[#{method}][#{k}]", value: v, class: "json-field-hidden-field")),
                  concat(content_tag(:input, "", type: 'text', value: k, class: "json-field-key-field")),
                  concat(content_tag(:span, ":")),
                  concat(content_tag(:input, "", type: 'text', value: v, class: "json-field-value-field")),
                  concat(content_tag(:a, "Remove", href: '#', class: "json-field-remove-field"))
                ]
              end
            )
          end

          concat(content_tag(:a, "Add", href: '#', class: 'json-field-add-field'))
          concat(javascript_tag("railsJsonField('#{id}', '#{@object_name}', '#{method}')"))
        end
      end
    end
  end
end

RailsJsonField::FormBuilder = RailsJsonField::Rails::FormBuilder
