module DataScienceTheater3000
  class Coordinates2Politics

    # @api private
    attr_accessor :coordinates

    # Accpets lat/lon coordinates and returns detailed political information.
    #
    # @param [String, Array] coordinates as either a single string or array of strings
    # @api public
    def initialize coordinates
      if coordinates.is_a?(Array)
        @coordinates = ActiveSupport::JSON.encode(coordinates.map!{|a|CGI::escape(a)}) if coordinates.is_a?(Array)
      elsif coordinates.is_a?(String) 
        @coordinates = CGI::escape(coordinates)
      elsif coordinates.is_a?(Hash)
        coordinates = sanitize(coordinates)
        @coordinates = ActiveSupport::JSON.encode(coordinates.map!{|a| a.map!{|b| CGI::escape(b)}}) if coordinates.is_a?(Array)
      end
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

    def sanitize coordinates
      # Clear out nil results
      coordinates.reject!{ |k,v| v.nil? }
      # Clear out any results that are not a longitude or latitude
      coordinates.each{ |k,v| coordinates[k].reject!{ |k,v| !["latitude","longitude"].include?(k) }}
      # Initialize an empty array to hold all the lat, long pairs
      a = []
      # Stuff each latitude,longitude (stringified) into the array
      coordinates.each{ |k,v| coordinates[k].keys.sort.each{ |ki| a << coordinates[k][ki].to_s }}
      sanitized_coordinates = []
      # Group the pairs into arrays within an array
      while a.length > 0
        sanitized_coordinates << a.slice!(0..1)
      end

      sanitized_coordinates
    end
  end
end
