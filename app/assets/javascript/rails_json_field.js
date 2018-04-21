function railsJsonField(id, objectName, attribute, currentValues) {
  var jsonField = $('#' + id);

  // generate add link
  jsonField.html("<a href='#' class='json-field-add-field'>Add</a>")
  var addFieldLink = jsonField.find('.json-field-add-field');

  var keyValuePair = function (key, value) {
    var name = objectName + '[' + attribute + '][' + key + ']';

    return "<div class='json-field-field'>" +
      "<input class='json-field-hidden-field' type='hidden' name='" + name + "' value='" + value + "'></input>" +
      "<input type='text' class='json-field-key-field' value='" + key + "'></input>" +
      "<span>:</span>" +
      "<input type='text' class='json-field-value-field' value='" + value + "'></input>" +
      "<a class='json-field-remove-field' href='#'>Remove</a>" +
    "</div>";
  }

  // display the current JSON of the object's attribute
  for (var key in currentValues) {
    if (currentValues.hasOwnProperty(key)) {
      $(keyValuePair(key, currentValues[key])).insertBefore(addFieldLink)
    }
  }

  addFieldLink.click(function (e) {
    e.preventDefault();
    $(keyValuePair('', '')).insertBefore($(this));
  });

  jsonField.on('click', 'a.json-field-remove-field', function (e) {
    e.preventDefault();
    $(this).parent('.json-field-field').remove();
  });

  jsonField.on("propertychange change click keyup input paste", 'input.json-field-key-field', function (e) {
    $(this).parent().find('input.json-field-hidden-field').attr('name', objectName + '[' + attribute + '][' + $(this).val() + ']');
  });

  jsonField.on("propertychange change click keyup input paste", 'input.json-field-value-field', function (e) {
    $(this).parent().find('.json-field-hidden-field').attr('value', $(this).val());
  });
}