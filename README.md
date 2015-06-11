This repository helps me build [w3af-kali](https://github.com/andresriancho/w3af-kali)
in an automated manner without modifying the main repository and bypassing CircleCI's
limitation where it's not possible to specify the path to circle.yml configuration.

[![Circle CI](https://circleci.com/gh/andresriancho/w3af-kali-ci.svg?style=svg)](https://circleci.com/gh/andresriancho/w3af-kali-ci)

Successful [w3af](https://github.com/andresriancho/w3af) builds will trigger a new
build of this repository.

## Limitations

These are some limitations that need to be fixed at some point:

 * Successful [w3af](https://github.com/andresriancho/w3af) builds will trigger a new
   build of this repository; but the build steps will get the latest release tag from
   the repository w3af instead of the latest version. In other words, if you want to
   really test a w3af-kali build you need to tag the version in the w3af repository.
   [Issue #1](https://github.com/andresriancho/w3af-kali-ci/issues/1)
   
 * A change in [w3af-kali](https://github.com/andresriancho/w3af-kali) doesn't
   trigger a `w3af-kali-ci` build.
