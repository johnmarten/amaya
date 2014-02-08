require 'spec_helper'

describe 'Index' do
  describe 'data' do
    it 'returns a HashWithIndifferentAccess' do
      Index.should_receive(:get).and_return({'page' => {'header' => {}}})
      Index.data.should be_a(HashWithIndifferentAccess)
    end

    it 'ensures image paths are prefixed with host' do
      Index.should_receive(:get).and_return(
          {'page' => {'header' => {'image' => 'images/game1.jpg'}}})
      Index.data[:header][:image].should eq('http://localhost:5000/images/game1.jpg')
    end
  end

end