function railsJsonField(id, objectName, attribute) {
  var jsonField = $('#' + id);
  var addFieldLink = jsonField.find('.json-field-add-field');

  addFieldLink.click(function (e) {
    e.preventDefault();
    $(
      "<div class='json-field-field'>" +
        "<input class='json-field-hidden-field' type='hidden' name='' value=''></input>" +
        "<input type='text' class='json-field-key-field'></input>" +
        "<span>:</span>" +
        "<input type='text' class='json-field-value-field'></input>" +
        "<a class='json-field-remove-field' href='#'>Remove</a>" +
      "</div>"
    ).insertBefore($(this));
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