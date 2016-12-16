module DocOrchestra
  class Configuration
    class UnknownStrategy < StandardError; end

    KNOWN_DOC_FORMATS  = ["apib"]
    KNOWN_DOC_STORAGES = ["s3"]

    def initialize(env)
      @env = env
    end

    def strategy
      {
        doc_format:  env_value(name: :doc_format,  whitelist: KNOWN_DOC_FORMATS),
        doc_storage: env_value(name: :doc_storage, whitelist: KNOWN_DOC_STORAGES),
        doc_path:    env_value(name: :doc_path),
      }
    end

    private

    def env_value(name:, whitelist: nil)
      env_var_name = name.to_s.upcase
      whitelisted_value(env_var_name, whitelist) || @env[env_var_name]
    end

    def whitelisted_value(env_var_name, whitelist = nil)
      if whitelist
        if whitelist.include?(@env[env_var_name])
          @env[env_var_name].to_sym
        else
          raise UnknownStrategy, "ENV var '#{env_var_name}' has unknown value, '#{@env[env_var_name]}'. See #{help_url} for details."
        end
      end
    end

    def help_url
      "https://github.com/zipmark/doc_orchestra"
    end
  end
end
