module DataScienceTheater3000
  module DataScienceToolkit

    # Performs a GET request to the datasciencetoolkit server
    class Request
      REQUEST_URL = "http://www.datasciencetoolkit.org"

      # @api private
      attr_accessor :request_method
      
      # @api private
      attr_accessor :request_params

      # @api public
      def initialize opts={}
        @request_method = opts.fetch(:request_method){ raise DataScienceTheater3000Error, "No request_method option specified" }
        @request_params = opts.fetch(:request_params){ raise DataScienceTheater3000Error, "No request_params option specified" }
      end

      # @api public
      def result
        @result ||= make_request
      end
      
      protected
      # @api private
      def make_request
        response = Curl::Easy.perform( REQUEST_URL + "/#{request_method}/" + "#{request_params}" ).body_str
        ActiveSupport::JSON.decode(response)
      end
    end

    # Performs a POST request to the datasciencetoolkit server
    # PostRequest class is always used via a subclass
    class PostRequest < Request

      # @api private
      attr_accessor :post_key

      # @api public
      def initialize opts={}
        super
        @post_key = opts.fetch(:post_key){ raise DataScienceTheater3000Error, "No post_key option specified" }
      end

      protected
      # Overridden in PostBodyRequest and PostFileRequest
      # @api private
      def make_request
        false
      end
    end

    class PostBodyRequest < PostRequest
      protected
      # @api private
      def make_request
        request = Curl::Easy.new(REQUEST_URL + "/#{request_method}")
        request.multipart_form_post = true
        request.http_post(Curl::PostField.content(post_key, request_params))
        ActiveSupport::JSON.decode(request.body_str)
      end
    end

    class PostFileRequest < PostRequest
      protected
      # @api private
      def make_request
        request = Curl::Easy.new(REQUEST_URL + "/#{request_method}")
        request.multipart_form_post = true
        request.http_post(Curl::PostField.file(post_key, request_params))
        request.body_str
      end
    end
  end
end

