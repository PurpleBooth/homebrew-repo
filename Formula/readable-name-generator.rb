class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.44"
  sha256 "dc5de7ab4f1469d3283e7609c512c4d132147c9674242683a2821aebb1d73025"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.44"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7dfc573a60c5954c1c9875e31196d82a69f9e3123c807ee3f53dfe3a65570ab8"
    sha256 cellar: :any_skip_relocation, ventura:       "5c49a31e777a68de9bef01883a660ed6290b350c0303db8e82aab36c807dab33"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "53d604943a17dddbb5038f5eb64c2ce876d5d3f8a68c9c7bf99ebbea15233205"
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
