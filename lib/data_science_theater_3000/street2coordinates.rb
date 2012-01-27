module DataScienceTheater3000
  class Street2Coordinates

    # @api private
    attr_accessor :address

    # Converts a street address into a location hash
    #
    # @param [String, Array] address as either a single string or array of strings
    # @api public
    def initialize address
      @address = CGI::escape(address) if address.is_a?(String)
      @address = ActiveSupport::JSON.encode(address.map!{|a|CGI::escape(a)}) if address.is_a?(Array)
    end

    # @return [Hash]
    # @api public
    def result
      dst_request.result
    end

    protected
    # @api private
    def dst_request
      @dst_request ||= DataScienceToolkit::Request.new(request_method: 'street2coordinates', request_params: address)
    end
  end
end
