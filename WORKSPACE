#WORKSPACE
workspace(name = "carla_python_api")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

load("//:carla_python_api_deps.bzl", "carla_python_api_deps")
carla_python_api_deps()


# python
load("@rules_python//python:repositories.bzl", "py_repositories")
py_repositories()

load("@rules_python//python:pip.bzl", "pip_parse")
pip_parse(
    name = "python_deps",
    requirements_lock = "//third_party:requirements.txt",
)

load("@python_deps//:requirements.bzl", "install_deps")
install_deps()


# Docker
# Download the rules_docker repository at release v0.14.4
load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)
container_repositories()

load(
    "@io_bazel_rules_docker//python:image.bzl",
    _py_image_repos = "repositories",
)
_py_image_repos()


# rules_docker is not strictly necessary, but interesting if you want to create
# and/or push docker containers for the examples. The docker executable is
# needed only if you want to run an image using Bazel.

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

container_pull(
    name = "carla-python-api-deploy-base",
    registry = "docker.io",
    repository = "python",
    tag = "3.8.16",
)