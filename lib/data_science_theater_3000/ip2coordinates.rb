module DataScienceTheater3000
  class Ip2Coordinates

    # @api private
    attr_accessor :ip

    # Converts a ip addresses into a location hash
    #
    # @param [Array, String] ip Either an array of ip strings or a single ip ip to be located
    # @api public
    def initialize ip
      @ip = CGI::escape(ip) if ip.is_a?(String)
      @ip = ActiveSupport::JSON.encode(ip.map!{|a|CGI::escape(a)}) if ip.is_a?(Array)
    end

    # @return [Hash]
    # @api public
    def result
      dst_request.result
    end

    protected
    # @api private
    def dst_request
      @dst_request ||= DataScienceToolkit::Request.new(request_method: 'ip2coordinates', request_params: ip)
    end
  end
end
