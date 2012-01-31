module DataScienceTheater3000
  class Html2Story

    # @api private
    attr_accessor :html_string

    # @param [String] 
    # @api public
    def initialize html_string
      @html_string = html_string
    end
    
    # @return [Hash]
    # @api public
    def result
      dst_request.result
    end
    
    protected
    # @api private
    def dst_request
      @dst_request ||= 
        case 
        when html_string.length < 7500
          DataScienceToolkit::Request.new(request_method => 'html2story', request_params => html_string)
        when html_string.length >= 7500
          DataScienceToolkit::PostBodyRequest.new(request_method => 'html2story', request_params => html_string, post_key => 'body')
        end
    end
  end
end
