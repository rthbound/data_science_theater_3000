module DataScienceTheater3000
  class Coordinates2Politics

    # @api private
    attr_accessor :coordinates

    # Accpets lat/lon coordinates and returns detailed political information.
    #
    # @param [String, Array] coordinates as either a single string or array of strings
    # @api public
    def initialize coordinates
      @coordinates = CGI::escape(coordinates) if coordinates.is_a?(String)
      @coordinates = ActiveSupport::JSON.encode(coordinates.map!{|a|CGI::escape(a)}) if coordinates.is_a?(Array)
    end

    # @return [Hash]
    # @api public
    def result
      dst_request.result
    end

    protected
    # @api private
    def dst_request
      @dst_request ||= DataScienceToolkit::Request.new(request_method: 'coordinates2politics', request_params: coordinates)
    end
  end
end
