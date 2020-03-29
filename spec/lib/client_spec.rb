require 'spec_helper'

describe Bricklink::Client do
  let(:get_item) { Bricklink::Client.new.get_item('num') }
  let(:get_price_guide) { Bricklink::Client.new.get_price_guide('num', 'new_or_used' => 'U') }

  before do
    expect_any_instance_of(OAuth::AccessToken).to receive(:get).and_return(res)
  end

  context 'success' do
    let(:res) { instance_double('Net::HTTPOK', body: 'success'.to_json) }

    before do
      expect(res).to receive(:is_a?).with(Net::HTTPOK).and_return(true)
    end

    it 'get_item' do
      expect_any_instance_of(Bricklink::Client).to receive(:call_api).with('/items/SET/num').and_call_original
      expect(get_item).to eq('success')
    end

    it 'get_price_guide' do
      expect_any_instance_of(Bricklink::Client).to receive(:call_api).with('/items/SET/num/price', hash_including('new_or_used' => 'U')).and_call_original
      expect(get_price_guide).to eq('success')
    end
  end

  context 'not_found' do
    let(:res) { instance_double('Net::HTTPNotFound', body: 'not_found') }

    before do
      expect(res).to receive(:is_a?).with(Net::HTTPOK).and_return(false)
    end

    it 'get_item' do
      expect { get_item }.to raise_error(RuntimeError, /not_found/)
    end

    it 'get_price_guide' do
      expect { get_price_guide }.to raise_error(RuntimeError, /not_found/)
    end
  end
end