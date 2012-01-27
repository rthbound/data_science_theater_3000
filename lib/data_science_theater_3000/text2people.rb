module DataScienceTheater3000
  class Text2People

    # @api private
    attr_accessor :name

    # Specify a name or names and return parsed result as well as a best-guess for gender
    #
    # @param [Array,String] name can be array of name strings or a single name
    # @api public
    def initialize name
      @name = ActiveSupport::JSON.encode(name) 
    end

    # @return [Hash] information related to the provided name(s)
    # @api public
    def result
      dst_request.result
    end

    protected
    # @api private
    def dst_request
      @dst_request ||= 
        DataScienceToolkit::PostBodyRequest.new(request_method: 'text2people', request_params: name, post_key: 'body')
    end
  end
end
