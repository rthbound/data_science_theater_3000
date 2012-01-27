$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

require "active_support"
require "json"
require "curb"
require "cgi"
require "data_science_theater_3000/version"

module DataScienceTheater3000
  autoload :DataScienceToolkit,   'data_science_theater_3000/data_science_toolkit'
  autoload :Ip2Coordinates,       'data_science_theater_3000/ip2coordinates'
  autoload :Street2Coordinates,   'data_science_theater_3000/street2coordinates'
  autoload :Coordinates2Politics, 'data_science_theater_3000/coordinates2politics'
  autoload :File2Text,            'data_science_theater_3000/file2text'
  autoload :Text2People,          'data_science_theater_3000/text2people'
  autoload :Text2Times,           'data_science_theater_3000/text2times'
  autoload :Text2Places,          'data_science_theater_3000/text2places'
  autoload :Html2Text,            'data_science_theater_3000/html2text'
  autoload :Html2Story,           'data_science_theater_3000/html2story'

  class DataScienceTheater3000Error < StandardError; end

  class File2TextError < DataScienceTheater3000Error; end
  
end
