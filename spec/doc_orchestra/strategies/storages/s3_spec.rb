require "doc_orchestra/strategies/storages/s3"

describe DocOrchestra::Strategies::Storages::S3 do
  let(:item) { double }

  subject { described_class.new(item) }

  describe "#upload" do
    it "returns true" do
      subject.method

    end
  end
end
