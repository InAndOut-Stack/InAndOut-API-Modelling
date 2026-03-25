# InAndOut-API-Modelling

Complete API model for our system.

Our system will support three different services, each one having their own constraints and resources.

This repository is meant to be used as a [git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) in all of its parent projects. Each of these parents must define their own [smithy-build.json](./smithy-build.json).

Parent Java services should use [gradle](https://docs.gradle.org/current/userguide/build_lifecycle.html) as the build system and define [InAndOut-API-Modelling](https://github.com/InAndOut-Stack/InAndOut-API-Modelling/) as a [subproject](https://docs.gradle.org/current/userguide/multi_project_builds.html).

References:

- https://docs.google.com/document/d/1HnRcB2SaG4f4QodOaaYZT4r4GYhibqBzA8wdl2zpID0/edit?tab=t.h8qwaqvashle
- https://openapi-converter.com/json-to-yaml
- https://editor.swagger.io/
- https://smithy.io/2.0/languages/java/quickstart.html
- https://smithy.io/2.0/languages/java/client/generating-clients.html
- https://smithy.io/2.0/guides/using-code-generation/generating-a-client.html
