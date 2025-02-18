class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.34"
  sha256 "4290a6ef3d3fc6ccae998fcf4b817354661d6d497759ee378c049b238695b522"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.34"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "755db3170ac301e5988baf22289b305a8ea4082a86ac128615561e0107e496e7"
    sha256 cellar: :any_skip_relocation, ventura:       "8a1f230049726d35c236f7ce2cb144c4a0405c4f41078ef13410b4432513214a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1849eb00db0b46c508b2930d72ae8499d16071d89c6070adb10203e7510098ba"
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
