require './test/test_helper'

describe DataScienceTheater3000::DataScienceToolkit::Request do
  before do
    stub_request(:any, /.*datasciencetoolkit.*/).to_return(File.new('./test/ip2coordinates.txt'))
  end
  
  describe '#result' do
    it 'returns a hash' do
      DataScienceTheater3000::DataScienceToolkit::Request.new(request_params: 'foo', request_method: 'bar').result.must_be_instance_of Hash
    end
  end

  describe 'initialized without a request_method' do
    it 'raises a DataScienceTheater3000Error' do
      proc{ DataScienceTheater3000::DataScienceToolkit::Request.new(request_params: 'foo')}.must_raise DataScienceTheater3000::DataScienceTheater3000Error
    end
  end
  
  describe 'initialized without request_params' do
    it 'raises a DataScienceTheater3000Error' do
      proc{ DataScienceTheater3000::DataScienceToolkit::Request.new(request_method: 'foo')}.must_raise DataScienceTheater3000::DataScienceTheater3000Error
    end
  end
end

describe DataScienceTheater3000::DataScienceToolkit::PostRequest do
  describe 'initialized without a post_key' do
    it 'raises a DataScienceTheater3000Error' do
      proc{ DataScienceTheater3000::DataScienceToolkit::PostRequest.new(request_params: 'foo', request_method: 'bar')}.must_raise DataScienceTheater3000::DataScienceTheater3000Error
    end
  end

  describe '#make_request' do
    it 'returns false' do
      DataScienceTheater3000::DataScienceToolkit::PostRequest.new(request_method: 'foo', request_params: 'bar', post_key: 'baz').send(:make_request).must_equal false
    end
  end
end

describe DataScienceTheater3000::DataScienceToolkit::PostBodyRequest do
  before do
    stub_request(:any, /.*datasciencetoolkit.*/).to_return(File.new('./test/text2people.txt'))
  end
  
  describe '#result' do
    it 'returns a hash' do
      DataScienceTheater3000::DataScienceToolkit::PostBodyRequest.new(request_method: 'bar', request_params: 'foo', post_key: 'baz').result.must_be_instance_of String
    end
  end
end

describe DataScienceTheater3000::DataScienceToolkit::PostFileRequest do
  before do
    stub_request(:any, /.*datasciencetoolkit.*/).to_return(File.new('./test/file2text.txt'))
  end
  
  describe '#result' do
    it 'returns a hash' do
      DataScienceTheater3000::DataScienceToolkit::PostFileRequest.new(request_method: 'bar', request_params: 'foo', post_key: 'baz').result.must_be_instance_of String
    end
  end
end
