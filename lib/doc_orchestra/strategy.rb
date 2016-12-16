module DocOrchestra
  class Strategy
    def initialize(config)
      config.required_values("DOC_STORAGE", "s3")
      @config = config
    end

    def orchestrate
      storage.upload
    end

    private

    def storage
      Strategies::Storages::S3.new(config: @config)
    end
  end
end
