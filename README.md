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

    request = DataScienceTheater3000::Ip2Coordinates.new('8.8.8.8')
    > #<DataScienceTheater3000::Ip2Coordinates:0x000000019c7f60 @ip="8.8.8.8">
    request.result
    > {"8.8.8.8"=>{"longitude"=>-122.057403564453, "country_name"=>"United States", "postal_code"=>"94043", "region"=>"CA", "locality"=>"Mountain View", "country_code"=>"US", "dma_code"=>807, "latitude"=>37.4192008972168, "country_code3"=>"USA", "area_code"=>650}}


## Contributing

We love contributions! please fork the project, make your changes in a branch, then send us a pull request.

If you find a bug, please post it in the GitHub Issue Tracker
