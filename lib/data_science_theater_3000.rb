require "active_support"
require "json"
require "curb"
require "data_science_theater_3000/version"

module DataScienceTheater3000
  # Converts an ip address into a location hash
  #
  # @param [String] ip the ip address to be located
  # @return [Hash] hash of location information. Can be passed as input to coordinates2politics
  def self.ip2coordinates ip
    url = "http://www.datasciencetoolkit.org"
    response = Curl::Easy.perform( url + "/ip2coordinates/" + ip ).body_str

    coordinates = make_hashy(response)
    # Account for satellite provider or anonymous proxy
    if coordinates.invert.keys.include?(nil)
      coordinates[ip] = { :longitude => "unknown", :latitude => "unknown", :country => "unknown", :region => "unknown", :postal_code => "unknown" }
    end
    coordinates
  end

  # Converts a street address into a location hash
  #
  # @param [String, Array] address as either a single string or array of strings
  # @return [Hash] hash of location information. Can be passed as input to coordinates2politics
  def self.street2coordinates address
    url = "http://www.datasciencetoolkit.org"
    if address.class == String
      address.gsub!(",", "%2c").gsub!(" ", "+")
      response = Curl::Easy.perform( url + "/street2coordinates/" + address ).body_str
    elsif address.class == Array
      address.each {|a| a.gsub!(",", "%2c").gsub!(" ", "+") }
      address = ActiveSupport::JSON.encode(address)
      response = Curl::Easy.perform( url + "/street2coordinates/" + address ).body_str
    end
    coordinates = make_hashy(response)
  end
  
  # Uses latitude,longitude pair to find detailed political information about a location.
  # Currently supporting a single pair.
  #
  # @param [Hash,String] hash returned from ip2coordinates/street2coordinates or just a string like "33,-86"
  # @return [Array] contains hashes with detailed political information for a location
  def self.coordinates2politics coords 
    if coords.class == Hash
      coords = coords.keys.map{|k| "#{coords[k]["latitude"]},#{coords[k]["longitude"]}"}.first
    end

    url = "http://www.datasciencetoolkit.org"
    coords.gsub!( "," , "%2c" )
    response = Curl::Easy.perform( url + "/coordinates2politics/" + coords ).body_str

    coordinates = make_hashy(response)
  end
  
  def self.text2people name
    #url = "http://www.datasciencetoolkit.org"
    #response = Curl::Easy.perform( url + "/text2people/" + name ).body_str

    #person = make_hashy(response)
  end

  def self.text2times text
    #url = "http://www.datasciencetoolkit.org"
    #response = Curl::Easy.perform( url + "/text2times/" + text ).body_str

    #times = make_hashy(response)
  end

  # Specify path to an image file and return the discernable text.
  #
  # @param [String] file_path
  # @return [String] text discerned from image
  def self.file2text file_path
    file_reg = /([^\s]+(\.(?i)(jpg|png|gif|bmp))$)/
    raise "Does not look like path to a file: #{file_path}" if !file_reg.match(file_path)
    raise "Support paths to images hosted remotely soon" if file_path.include?('http:')
    url = "http://www.datasciencetoolkit.org"
    c = Curl::Easy.new( url + '/file2text')
    c.multipart_form_post = true
    c.http_post(Curl::PostField.file('inputfile', file_path))

    response = c.body_str
  end

  def self.make_hashy response
    ActiveSupport::JSON.decode(response)
  end
end
