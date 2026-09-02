module ApplicationHelper
  def lucide_icon(name, options = {})
    paths = case name
    when "check"
      tag.path(d: "M20 6 9 17l-5-5")
    when "circle-pause"
      safe_join([ tag.circle(cx: 12, cy: 12, r: 10), tag.path(d: "M10 9v6M14 9v6") ])
    when "circle-check-big"
      safe_join([ tag.path(d: "M22 11.08V12a10 10 0 1 1-5.93-9.14"), tag.path(d: "M22 4 12 14.01l-3-3") ])
    else
      tag.circle(cx: 12, cy: 12, r: 10)
    end

    data = options.delete(:data)
    css_class = options.delete(:class)
    tag.svg(paths, xmlns: "http://www.w3.org/2000/svg", viewBox: "0 0 24 24", fill: "none",
      stroke: "currentColor", "stroke-width": 2, "stroke-linecap": "round",
      "stroke-linejoin": "round", class: css_class, data: data, **options)
  end
end
