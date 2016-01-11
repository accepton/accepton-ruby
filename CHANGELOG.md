# Change Log

All notable changes to this project will be documented in this file. This
project adheres to [Semantic Versioning 2.0.0][semver]. Any violations of this
scheme are considered to be bugs.

[semver]: http://semver.org/spec/v2.0.0.html

## [0.3.1][0.3.1] - 2016-01-11

### Fixed

- Added an explicit dependency to addressable, since it doesn't appear as a
  dependency for HTTP.rb in the version that we're using. This prevents the
  issue of being unable to load `addressable/uri` in a fresh environment.

## [0.3.0][0.3.0] - 2015-11-06

### Added

- Added support for creating plans.
- Added support for querying singular and lists of plans.
- Added support for cancelling subscriptions.
- Added support for querying singular and lists of subscriptions.

## [0.2.0][0.2.0] - 2015-09-18

### Added

- Added support for querying lists of promo codes.

## 0.1.0 - 2015-07-20

### Added

- Initial version.

[0.3.1]: https://github.com/accepton/accepton-ruby/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/accepton/accepton-ruby/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/accepton/accepton-ruby/compare/v0.1.0...v0.2.0
[unreleased]: https://github.com/accepton/accepton-ruby/compare/v0.2.0...HEAD
