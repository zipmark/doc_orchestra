# doc_orchestra

**Important:** this gem is not production ready.

## The problem

You have systems that change and their documentation gets
outdated because they are maintaned manually.

**The solution**

DocOrchestra attempts to help mitigate that problem with several
functionalities:

* automate document generation (e.g [rspec_api_documentation](https://github.com/zipmark/rspec_api_documentation) )
* automate linting of the document files (e.g [linter-api-blueprint](https://github.com/zdne/linter-api-blueprint)
* automate testing the documentation against real APIs (e.g [dredd](https://github.com/apiaryio/dredd))
* automate concatenating multiple documentation files into one (e.g microservirces)
* automate generating [API Elements](http://api-elements.readthedocs.io/en/latest/)
* automate publishing the documentation to the cloud (e.g S3)


## Installation

Add this line to your application's Gemfile under development:

```ruby
gem 'doc_orchestra'
```

And then execute:

    $ bundle

## Usage

Running this tool requires specifying a few options via ENV variables, like
the following:

```
DOC_PATH=./docs/main.apib DOC_STORAGE=s3 doc_orchestra sync
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zipmark/doc_orchestra.

## License

License can be read at [LICENSE](/LICENSE)
