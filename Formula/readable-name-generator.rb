class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.1.3.tar.gz"
  sha256 "a35e4fc4f290947652b548a01029d100d20d64a7a2fda8bdd209a6e7fe36a293"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "310cbbaf0d3fbd3bce1a2ba569b2b7ff0d207db78ba5ed95be03527986dd0cb3"
    sha256 cellar: :any_skip_relocation, ventura:      "56b28b7959b2abe95fa80e8ba3b907295ec46831732e9198c4d48f428656d601"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "258580956b0478018b93454abd7a6b1c710442628635f8868f8c17945f73e625"
  end
  depends_on "help2man" => :build
  depends_on "rust" => :build

  def install
    # Build binary
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."

    # Completions
    generate_completions_from_executable(bin/"readable-name-generator", "--completion-shell",
shells: [:bash, :zsh, :fish])

    # Man pages
    output = Utils.safe_popen_read("help2man", bin/"readable-name-generator")
    (man1/"readable-name-generator.1").write output
  end

  test do
    system bin/"readable-name-generator", "-h"
    system bin/"readable-name-generator", "-V"
    assert_match "gregarious_pauli", shell_output(bin/"readable-name-generator --initial-seed 1")
  end
end
