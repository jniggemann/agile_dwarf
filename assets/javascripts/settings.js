jQuery(function ()
{
    jQuery.noConflict();
    jQuery('#settings_stcolumncount').change(function ()
    {
        var count = jQuery(this).val();
        jQuery('#stcolumns p:lt(' + count + ')').show();
        jQuery('#stcolumns p:gt(' + (count - 1) + ')').hide();
    }).change();
});

jQuery(document).ready(function()
{
  jQuery('#settings_custom_field_type').select2({
    width: 200
  })

  jQuery('#add_custom_field_type button').click(function () {
    var value = jQuery('#add_custom_field_type input').val();
    if (jQuery('#settings_custom_field_type option').filter(function () { return jQuery(this).html() == value; }).size() == 0) {
      jQuery.ajax({
        type: 'POST',
        dataType: 'json',
        data: {
          'custom_task_field_type': {'name': value}
        },
        url: '/custom_field_types',
        success: function (data) {
          id = data.id
          jQuery('#add_custom_field_type input').val('');

          jQuery('#settings_custom_field_type')
            .append(
              jQuery("<option></option>")
              .attr('value', id)
              .text(value)
              );
        }
      });
    }
    else {
      alert("Custom field type '" + value + "' exists.");
      jQuery('#add_custom_field_type input').focus();
    }

    return false;
  })

  jQuery('#remove_custom_field_type button').click(function () {
    var option = jQuery('#settings_custom_field_type option:selected');
    var id = option.val();
    if (typeof id !== 'undefined') {
      jQuery.ajax({
        type: 'DELETE',
        dataType: 'json',
        url: '/custom_field_types/' + id,
        success: function () {
          option.removeAttr("selected");
          option.remove();
          jQuery('#settings_custom_field_type').parent().find('.select2-chosen').html('');
        }
      })
    }

    return false;
  })
});
