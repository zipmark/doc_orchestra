require "doc_orchestra/version"
require "doc_orchestra/configuration"
require "doc_orchestra/log"
require "doc_orchestra/strategy"
require "doc_orchestra/strategies/storage"
require "doc_orchestra/strategies/storages/s3"

module DocOrchestra
  def self.run(env = ENV)
    @config = Configuration.new(env)

    @strategy = Strategy.new(@config)
    @strategy.orchestrate
  end
end
