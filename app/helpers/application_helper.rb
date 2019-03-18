module ApplicationHelper

  def render_flash(key, value)
    flash_key_map = {
      'notice' => 'info',
      'alert'  => 'warning',
      'error'  => 'danger'
    }
    html = "<div class=\"alert alert-#{flash_key_map[key]}\" alert-dismissible fade show\" role=\"alert\">"
    html << value.html_safe
    html << "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">"
    html << "<span aria-hidden=\"true\">&times;</span>"
    html << "</button>"
    html << "</div>"
    html.html_safe
  end

  def render_offers(offers, columns = 3)
    # @see:
    # https://ruby-doc.org/core-2.5.3/Array.html#method-c-new-label-Common+gotchas
    rows = (offers.size.to_f / columns.to_f).ceil
    Array.new(rows) { [] }.tap do |matrix|
      (0...(rows * columns)).to_a.map do |i|
        col = i % rows
        matrix[col] << offers[i]
      end
    end
  end

  def build_progress_bar(total, part)
    html = '<div class="progress">'
    progress = (total.to_i > 0) ? ((part.to_f / total.to_f) * 100.0).to_i : 0
    progress_class =
      case
      when (0...30).include?(progress)
        "progress-bar bg-danger"
      when (31...60).include?(progress)
        "progress-bar bg-warning"
      when (61...99).include?(progress)
        "progress-bar bg-info"
      else
        "progress-bar bg-success"
      end
    if progress.nonzero?
      html << "<div class=\"#{progress_class}\" role=\"progressbar\" style=\"width:#{progress}%;\" aria-valuenow=\"#{progress}\" aria-valuemin=\"0\" aria-valuemax=\"100\">$#{part} / $ #{total}</div>"
    else
      html << "$0 / $#{total}"
    end
    html << '</div>'
  end
end
