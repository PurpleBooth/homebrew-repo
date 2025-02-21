class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.36"
  sha256 "fae04f4f0db9394e12193f777e2f4f92fa7eadfb543b1167ba0108e2124709d9"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.36"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2e1e09160cbab1487c9dcf0ed7a780b557dc569c5af8a480d8083bc9bd1a3d9d"
    sha256 cellar: :any_skip_relocation, ventura:       "d570aa12894dbd2d3971b21ccdcdb90d1e9b924a8106563711ec7aa6bf5ffe9d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "11c6a1e4330aa1f3909e1837efe114f2aff71aa04f1ee82ee027add6f46b87ad"
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
