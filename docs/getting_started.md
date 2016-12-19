# Getting Started

[WIP]

Each one of these steps will depend on the orchestration strategies chosen.
These are the strategies that can be defined:

* `DOC_FORMAT`: depending on this value, specific linting and testing tools
  will be used. For instance, in a project with API Blueprint,
  `DOC_FORMAT=apib` will define usage of `dredd` as testing tool.
* `DOC_STORAGE`: where will
  will be used. For instance, in a project with API Blueprint,
  `DOC_FORMAT=apib` will define usage of `dredd` as testing tool.


### Options

These are the options that can be defined. For details on how

* `DOC_FORMAT` (required, string): defines the format of the documentation.
  Accepted values are: `apib` (APIBlueprint).
* `DOC_STORAGE` (required, string): defines where the documentation will be stored.
  Accepted values are: `s3` (APIBlueprint).
* `DOC_ELEMENTS` (int): `1` to convert docs to
  [API Elements](http://api-elements.readthedocs.io/en/latest/). Defaults to
  `0`.
