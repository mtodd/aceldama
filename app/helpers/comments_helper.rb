module Merb
  module CommentsHelper
    
    def document_write(body_html = nil, &body_proc)
      if block_given?
        # capture from block if necessary
        body_html = capture(&body_proc)
      end
      
      body_html = body_html.split("\n").map do |line|
        "document.write('#{line}');"
      end.join("\n")
      
      # handle output accordingly
      if block_given?
        concat(body_html, body_proc.binding)
      else
        body_html
      end
    end
    
  end
end # Merb
