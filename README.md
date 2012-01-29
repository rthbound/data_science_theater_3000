# data_science_theater_3000

Ruby API wrapper for the [Data Science Toolkit](http://www.datasciencetoolkit.org/)

### Installation

#### Ubuntu users may need to install dependencies for curb:
    $ sudo apt-get install libcurl3 libcurl3-gnutls libcurl4-openssl-dev
    $ gem install curb
#### Then:
    $ gem install data_science_theater_3000

### Usage

#### Just ...
    require "data_science_theater_3000"

    request = DataScienceTheater3000::Ip2Coordinates.new( '8.8.8.8' )
    > #<DataScienceTheater3000::Ip2Coordinates:0x000000019c7f60 @ip="8.8.8.8">
    request.result
    > {"8.8.8.8"=>{"longitude"=>-122.057403564453, "country_name"=>"United States", "postal_code"=>"94043", "region"=>"CA", "locality"=>"Mountain View", "country_code"=>"US", "dma_code"=>807, "latitude"=>37.4192008972168, "country_code3"=>"USA", "area_code"=>650}}

#### This is also fun ... pass street/ip2coordinates output to coordinates2politics
    locations_request = DataScienceTheater3000::Ip2Coordinates.new( ["8.8.8.8", "74.125.224.72"] )
    > #<DataScienceTheater3000::Ip2Coordinates:0x000000026b17f8 @ip="[\"8.8.8.8\",\"74.125.224.72\"]">

    locations = locations_request.result
    > {"8.8.8.8"=>{ ... ... ... }, "74.125.224.72"=>{ ... ... ... }}

    politics_request = DataScienceTheater3000::Coordinates2Politics.new( locations )
    > #<DataScienceTheater3000::Coordinates2Politics:0x00000002ba6470 @coordinates="[[\"37.4192008972168\",\"-122.057403564453\"],[\"37.4192008972168\",\"-122.057403564453\"]]"> 

    politics = politics_request.result
    > [{"politics"=>[{"type"=>"admin2", "code"=>"usa", "name"=>"United States", "friendly_type"=>"country"}, {"type"=>"admin4", "code"=>"us06", "name"=>"California", "friendly_type"=>"state"}, {"type"=>"constituency", "code"=>"06_14", "name"=>"Fourteenth district, CA", "friendly_type"=>"constituency"}, {"type"=>"admin5", "code"=>"06_49670", "name"=>"Mountain View", "friendly_type"=>"city"}, {"type"=>"admin5", "code"=>"_", "name"=>"", "friendly_type"=>"city"}, {"type"=>"admin6", "code"=>"06_085", "name"=>"Santa Clara", "friendly_type"=>"county"}, {"type"=>"admin5", "code"=>"06_77000", "name"=>"Sunnyvale", "friendly_type"=>"city"}], "location"=>{"longitude"=>"-122.057403564453", "latitude"=>"37.4192008972168"}}, {"politics"=>[{"type"=>"admin2", "code"=>"usa", "name"=>"United States", "friendly_type"=>"country"}, {"type"=>"admin4", "code"=>"us06", "name"=>"California", "friendly_type"=>"state"}, {"type"=>"constituency", "code"=>"06_14", "name"=>"Fourteenth district, CA", "friendly_type"=>"constituency"}, {"type"=>"admin5", "code"=>"06_49670", "name"=>"Mountain View", "friendly_type"=>"city"}, {"type"=>"admin5", "code"=>"_", "name"=>"", "friendly_type"=>"city"}, {"type"=>"admin6", "code"=>"06_085", "name"=>"Santa Clara", "friendly_type"=>"county"}, {"type"=>"admin5", "code"=>"06_77000", "name"=>"Sunnyvale", "friendly_type"=>"city"}], "location"=>{"longitude"=>"-122.057403564453", "latitude"=>"37.4192008972168"}}]

#### Try out the File2Text feature:
    request = DataScienceTheater3000::File2Text.new("doc/sample.png")
    > #<DataScienceTheater3000::File2Text:0x000000025da370 @file_path="doc/sample.png"> 
    request.result
    > "lf you pass in an image, this API will run an optical character recoghition algorithm to extract any words or\nsentences it can from the picture. lf you upload a PDF file, Word document, Excel spreadsheet or HTML file, it\nwill retum a plain text version of the content. Unlike most of the calls, this one takes its input in the standard\nmultipart form-encoded format that\xE2\x80\x99s used when browsers upload files, rather than as JSON. lt retums any content\nit finds as a stream of text.\n" 


## Contributing

We love contributions! please fork the project, make your changes in a feature branch, then send us a pull request.

If you find a bug, please post it in the GitHub Issue Tracker.
