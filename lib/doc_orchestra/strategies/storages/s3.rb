require 'aws-sdk'

module DocOrchestra
  module Strategies
    module Storages
      class S3
        REQUIRED_CONFIG = [
          "STORAGE_KEY", "STORAGE_SECRET", "STORAGE_BUCKET"
        ]

        def initialize(config:, region: 'us-west-2')
          config.required_keys(*REQUIRED_CONFIG)
          @key    = config["STORAGE_KEY"]
          @secret = config["STORAGE_SECRET"]
          @bucket = config["STORAGE_BUCKET"]
          @region = config["STORAGE_REGION"] || region
        end

        def upload
          setup_credentials
          create_bucket
        end

        private

        def setup_credentials
          Aws.config.update(
            region: @region,
            credentials: credentials
          )
        end

        def credentials
          Aws::Credentials.new(@key, @secret)
        end

        def create_bucket
          s3 = Aws::S3::Resource.new
          s3.bucket(@bucket).create
          Log.out("Creating bucket '#{@bucket}'... done.")
        rescue Aws::S3::Errors::BucketAlreadyExists, Aws::S3::Errors::BucketAlreadyOwnedByYou
          Log.out("Bucket '#{@bucket}' already exists.")
        end
      end
    end
  end
end
