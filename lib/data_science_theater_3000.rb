require "curb"
require "data_science_theater_3000/version"

module DataScienceTheater3000
  # Converts an ip address into a location hash
  #
  # @param [String] ip the ip address to be located
  # @return [Hash] key is the ip string passed in as parameter, value is a hash of location information.
  def self.ip2coordinates ip
    url = "http://www.datasciencetoolkit.org"
    response = Curl::Easy.perform( url + "/ip2coordinates/" + ip ).body_str
    coordinates = make_hashy(response).with_indifferent_access
  end

  # Converts a street address into a location hash
  #
  # @param [String] address the address to be located
  # @return [Hash] key is the address string passed in as a paremeter, value is a hash of location information
  def self.street2coordinates address
    url = "http://www.datasciencetoolkit.org"
    address.gsub!( "," , "%2c" )
    address.gsub!( " " , "+"   )
    response = Curl::Easy.perform( url + "/street2coordinates/" + address ).body_str

    coordinates = make_hashy(response)
  end
  
  # Uses latitude,longitude pair to find detailed political information about a location.
  # Currently supporting a single pair.
  #
  # @param [String] "latitude,longitude"
  # @return [Array] Array containing hashes with detailed political information about a location
  def self.coordinates2politics coords
    url = "http://www.datasciencetoolkit.org"
    coords.gsub!( "," , "%2c" )
    response = Curl::Easy.perform( url + "/coordinates2politics/" + coords ).body_str

    coordinates = make_hashy(response)
  end
  
  def self.text2people name
    #TODO should take array of names as well
    #FIXME curl wants different arguments
    #url = "http://www.datasciencetoolkit.org"
    #response = Curl::Easy.perform( url + "/text2people/" + name ).body_str

    #person = make_hashy(response)
  end

  def self.text2times text
    #url = "http://www.datasciencetoolkit.org"
    #text.gsub!( "," , "%2c" )
    #FIXME curl wants different arguments
    #response = Curl::Easy.perform( url + "/text2times/" + text ).body_str

    #times = make_hashy(response)
  end

  def self.make_hashy response
    ActiveSupport::JSON.decode(response)
  end
end
