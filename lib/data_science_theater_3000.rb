require "curb"
require "data_science_theater_3000/version"

module DataScienceTheater3000
  def self.ip2coordinates ip
    url = "http://www.datasciencetoolkit.org"
    response = Curl::Easy.perform( url + "/ip2coordinates/" + ip ).body_str
    coordinates = make_hashy(response).with_indifferent_access
    if coordinates[ip].nil?
      coordinates = { ip => {"country_name"=>"United States", "region"=>"AL", "dma_code"=>630, "latitude"=>33.4667015075684, "country_code"=>"US", "area_code"=>205, "postal_code"=>"35209", "locality"=>"Birmingham", "country_code3"=>"USA", "longitude"=>-86.8066024780273}}.with_indifferent_access
    else
      coordinates
    end
  end

  def self.street2coordinates address
    url = "http://www.datasciencetoolkit.org"
    address.gsub!( "," , "%2c" )
    address.gsub!( " " , "+"   )
    response = Curl::Easy.perform( url + "/street2coordinates/" + address ).body_str

    coordinates = make_hashy(response)
  end
  
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
