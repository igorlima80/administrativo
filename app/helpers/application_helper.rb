module ApplicationHelper
  def eval_with_rescue(code)
    begin
      eval(code)
    rescue Exception => e
      "error"
    end
  end

  def display_status(status)
    "<span class='label label-#{class_label_status(status)}'>#{t(status).downcase}</span>".html_safe
  end

  def class_label_status(status)
    case status
      when 'new'
        'danger'
      when 'paid'
        'success'
      when 'processed'
        'warning'
    end
  end

  def bar_color(color="#ffffff")
    "<span class='btn btn-flat bg-black no-padding2' style='background: #{color} !important'>&nbsp;</span>".html_safe
  end

  def display_tree(units)
    html=''
    html << "<ul id='treee' data-widget='tree'><li>Unidades"
    html << display_subtree(units)
    html << "</li></ul>"
    return html
  end

  def display_subtree(units)
    html=''
    units.order(:name).each do |unit|
      html << "<ul><li>#{unit.name} - #{unit.description}"
      if unit.children.size > 0
        html << display_subtree(unit.children)
      end
      html << "</li></ul>"
    end
    return html
  end
end
