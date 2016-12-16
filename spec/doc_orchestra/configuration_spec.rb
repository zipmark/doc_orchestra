require "spec_helper"

describe DocOrchestra::Configuration do
  let(:env) do
    {
      "DOC_STORAGE"  => "s3",
      "CUSTOM_KEY"   => "custom value",
      "BLANK_STRING" => "",
    }
  end

  subject(:config) { described_class.new(env) }

  describe "#required_keys" do
    context 'when no key is missing' do
      it 'does not raise errors' do
        expect {
          config.required_keys("CUSTOM_KEY", "DOC_STORAGE")
        }.to_not raise_error
      end
    end

    context 'when one key is not defined' do
      it 'raises an error' do
        expect {
          config.required_keys("MISSING_KEY", "DOC_STORAGE")
        }.to raise_error described_class::MissingConfiguration
      end
    end
  end

  describe '#[]' do
    context 'value exists' do
      it 'returns an env var value' do
        expect(config["CUSTOM_KEY"]).to eq "custom value"
      end
    end

    context 'value is a blank string' do
      it 'returns nil' do
        expect(config["BLANK_STRING"]).to eq nil
      end
    end

    context 'value does not exist' do
      it 'returns nil' do
        expect(config["NO_KEY"]).to eq nil
      end
    end
  end

  describe '#required_values' do
    context 'a value is incorrect' do
      it 'raises' do
        expect {
          config.required_values("DOC_STORAGE", "s4", "s5")
        }.to raise_error described_class::UnexpectedConfiguration
      end
    end

    context 'the key does not exist' do
      it 'raises' do
        expect {
          config.required_values("NO_KEY", "s3")
        }.to raise_error described_class::MissingConfiguration
      end
    end

    context 'a value is incorrect' do
      it 'raises' do
        expect {
          config.required_values("DOC_STORAGE", "s3")
        }.to_not raise_error
      end
    end
  end
end
