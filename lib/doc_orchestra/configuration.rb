module DocOrchestra
  class Configuration
    class UnexpectedConfiguration < StandardError; end
    class MissingConfiguration < StandardError; end

    def initialize(env)
      @env = env
      @dictionary = {}
    end

    def [](key)
      if @env[key] != ""
        @env[key]
      end
    end

    def required_keys(*keys)
      keys.each do |key|
        if blank_value?(@env[key])
          raise MissingConfiguration, "The following environment variables are missing: #{key}"
        end
      end
    end

    def required_values(key, *values)
      required_keys(key)
      unless values.include?(self[key])
        raise UnexpectedConfiguration, "Environment variable #{key} accepted values are: #{values.join(", ")} (#{self[key]} provided). #{help_url}"
      end
    end

    private

    def blank_value?(str)
      str.nil? || str == ""
    end

    def help_url
      "See https://github.com/zipmark/doc_orchestra for details."
    end
  end
end
