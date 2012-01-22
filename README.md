# data_science_theater_3000


### Installation

#### Ubuntu users may need to install dependencies for curb:
    $ sudo apt-get install libcurl3 libcurl3-gnutls libcurl4-openssl-dev
    $ gem install curb
#### Then:
    $ gem install data_science_theater_3000

### Usage

#### Just ...
    require "data_science_theater_3000"
    
    DataScienceTheater3000.ip2coordinates(ip_string)
    DataScienceTheater3000.file2text(path_to_file) # local files only right now
    DataScienceTheater3000.coordinates2politics(lat_long_string)
    DataScienceTheater3000.street2coordinates(address_string)

Or
    dst3k = DataScienceTheater3000
    dst3k.coordinates2politics( dst3k.ip2coordinates(ip_string) )
    dst3k.coordinates2politics( dst3k.street2coordinates(address_string) )

## Contributing

We love contributions! please fork the project, make your changes in a branch, then send us a pull request.

If you find a bug, please post it in the GitHub Issue Tracker
