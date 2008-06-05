module HomeHelper
  def faq(title, start_open = true, &block)
    tid = title.gsub(/[^a-zA-Z]/, "_")
    inner = capture(&block)

    plus = content_tag  :span, "(+)", :id => tid + "_plus", 
                        :style => (start_open ? "display:none" : "")
    minus = content_tag :span, "(-)", :id => tid + "_minus",
                        :style => (!start_open ? "display:none" : "")

    title_text = link_to_function(title + " " + plus + minus,                 "$('#{tid}').toggle();$('#{tid}_plus').toggle();$('#{tid}_minus').toggle();")

    title = content_tag :div, title_text, :class => "faq_title"

    body_options = { :class => "faq_body", :id => tid }
    body_options[:style] = "display:none" unless start_open

    body = content_tag :div, inner, body_options

    whole = content_tag :div, title + body, :class => "faq_area"

    concat whole, block.binding
  end
end