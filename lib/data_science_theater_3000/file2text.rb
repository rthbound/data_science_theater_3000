module DataScienceTheater3000
  class File2Text

    # @api private
    attr_accessor :file_path

    # @param [String] 
    # @api public
    def initialize file_path
      @file_path = file_path
      ensure_valid_file
    end

    # @return [Hash]
    # @api public
    def result
      dst_request.result
    end

    protected
    # @api private
    def ensure_valid_file
      raise File2TextError, "Does not look like path to a file: #{file_path}" unless file_path.match(/([^\s]+(\.(?i)(jpg|png|gif|bmp|pdf|html))$)/)
      raise File2TextError, "Remote files not supported.  Coming soon" if file_path.match(/^http/)
    end

    # @api private
    def dst_request
      begin
      @dst_request ||= 
        DataScienceToolkit::PostFileRequest.new(request_method: 'file2text', request_params: file_path, post_key: 'inputfile')
      rescue
      @dst_request ||= 
        DataScienceToolkit::PostFileRequest.new(request_method => 'file2text', request_params => file_path, post_key => 'inputfile')
      end
    end
  end
end
