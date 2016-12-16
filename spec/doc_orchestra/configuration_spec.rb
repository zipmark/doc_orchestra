require "doc_orchestra/configuration"

describe DocOrchestra::Configuration do
  let(:doc_format) { "apib" }
  let(:doc_storage) { "s3" }

  let(:env) do
    {
      "DOC_FORMAT" => doc_format,
      "DOC_STORAGE" => doc_storage
    }
  end

  subject(:config) { described_class.new(env) }

  describe "#strategy" do
    context 'doc_format' do
      subject { config.strategy[:doc_format] }

      context 'apib' do
        let(:doc_format) { "apib" }

        it "saves format strategy" do
          expect(subject).to eq :apib
        end
      end

      context 'unknown format' do
        let(:doc_format) { "something_else" }

        it "raises" do
          expect { subject }.to raise_error DocOrchestra::Configuration::UnknownStrategy
        end
      end
    end

    context 'doc_storage' do
      subject { config.strategy[:doc_storage] }

      context 's3' do
        let(:doc_storage) { "s3" }

        it "saves storage strategy" do
          expect(subject).to eq :s3
        end
      end

      context 'unknown storage' do
        let(:doc_storage) { "something_else" }

        it "raises" do
          expect { subject }.to raise_error DocOrchestra::Configuration::UnknownStrategy
        end
      end
    end

    context 'doc_path' do
      subject { config.strategy[:doc_path] }

      before do
        env.merge!("DOC_PATH" => doc_path)
      end

      context 'a file path is specified' do
        let(:doc_path) { "./some_path" }

        it "saves the doc path" do
          expect(subject).to eq "./some_path"
        end
      end

      context 'when no doc path specified' do
        let(:doc_path) { nil }

        it "returns nil" do
          expect(subject).to eq nil
        end
      end
    end
  end
end
