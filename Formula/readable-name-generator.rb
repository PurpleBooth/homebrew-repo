class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.47"
  sha256 "edc2f8d9cad4577e607457063a53707a5a36cbb16dff17070157ef7820329f49"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.47"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3ef87c47c6d5f12051939ec670b63ed5815ecb6b0dbdb21a25a0cfabbef03454"
    sha256 cellar: :any_skip_relocation, ventura:       "f4063eb8e68fb3e9b0b7e4970ac2053513bc06ca75c48625cff498acb07765d3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b3b99aa27a4a28bad8dd3194ebe7a2824d286500c8cea14520a4f42eb6465f1e"
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
    assert_match "flexible_briseglace", shell_output(bin/"readable-name-generator --initial-seed 1")
  end
end
