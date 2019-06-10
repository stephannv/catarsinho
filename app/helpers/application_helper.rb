module ApplicationHelper
  def errors_for(resource, attribute)
    return unless error_for?(resource, attribute)

    content_tag(:p, resource.errors[attribute.to_sym].first, class: 'help is-danger')
  end

  def input_class_for(resource, attribute)
    if error_for?(resource, attribute)
      'input is-danger'
    else
      'input'
    end
  end

  def error_for?(resource, attribute)
    resource && resource.errors[attribute.to_sym].any?
  end

  def to_brl(value)
    number_to_currency(value, unit: 'R$ ', precision: 2, separator: ',', delimiter: '.')
  end
end
