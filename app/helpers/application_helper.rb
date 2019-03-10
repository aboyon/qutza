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
end
