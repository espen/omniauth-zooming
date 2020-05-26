require 'spec_helper'
require 'omniauth-zoomer'

describe OmniAuth::Strategies::Zoomer do
  subject do
    strategy = OmniAuth::Strategies::Zoomer.new(nil, @options || {})
    strategy.stub(:session) { {} }
    strategy
  end

  it_should_behave_like 'an oauth2 strategy'

  describe '#client' do
    it 'should have the correct zoomer site' do
      subject.client.site.should eq("https://zoom.us")
    end

    it 'should have the correct authorization url' do
      subject.client.options[:authorize_url].should eq("https://zoom.us/oauth/authorize")
    end

    it 'should have the correct token url' do
      subject.client.options[:token_url].should eq('https://zoom.us/oauth/token')
    end

  end

  describe '#callback_path' do
    it 'should have the correct callback path' do
      subject.callback_path.should eq('/auth/zoomer/callback')
    end
  end

end
