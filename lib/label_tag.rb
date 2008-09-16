module ActionView
  module Helpers
    module FormTagHelper
      def label_tag(name, text = nil, options = {})
        content_tag :label, text || name.humanize, { "for" => name }.update(options.stringify_keys)
      end
    end
  end
end