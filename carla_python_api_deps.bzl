load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")



def carla_python_api_deps():
    """Loads common dependencies needed to compile the protobuf library."""
    if not native.existing_rule("rules_python"):
        http_archive(
            name = "rules_python",
            sha256 = "8c15896f6686beb5c631a4459a3aa8392daccaab805ea899c9d14215074b60ef",
            strip_prefix = "rules_python-0.17.3",
            url = "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.17.3.tar.gz",
        )
    if not native.existing_rule("io_bazel_rules_docker"):
        http_archive(
            name = "io_bazel_rules_docker",
            sha256 = "b1e80761a8a8243d03ebca8845e9cc1ba6c82ce7c5179ce2b295cd36f7e394bf",
            urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.25.0/rules_docker-v0.25.0.tar.gz"],
        )