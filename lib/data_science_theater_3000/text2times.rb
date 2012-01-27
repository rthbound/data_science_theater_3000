module DataScienceTheater3000
  class Text2Times

    # @api private
    attr_accessor :text_string
    
    # @param [String] 
    # @api public
    def initialize text_string
      @text_string = text_string
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
        when text_string.length < 7500
          DataScienceToolkit::Request.new(request_method: 'text2times', request_params: text_string)
        when text_string.length >= 7500
          DataScienceToolkit::PostBodyRequest.new(request_method: 'text2times', request_params: text_string, post_key: 'body')
        end
    end
  end
end
