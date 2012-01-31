module DataScienceTheater3000
  class Text2Places

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
        DataScienceToolkit::Request.new(request_method => 'text2places', request_params => text_string)
    end
  end
end
