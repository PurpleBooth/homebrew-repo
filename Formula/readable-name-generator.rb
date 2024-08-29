class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.1.1.tar.gz"
  sha256 "e16bc619cd2324569ca4edb532e22df86954d9ba6a2e06c1b40d74b26ffc59c2"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c1b60d1d2af6083d8723811f8f63a0888512d49f776fc9b74f3a31f9469ddd0c"
    sha256 cellar: :any_skip_relocation, ventura:      "6c344ff15108dcd1238caecf31d7327d4b977bd46f5019dc894d334c6334932b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a782fb69d8cd23ba41551625248fdd3db0bebd3f4642a3ca9a7686ee71e6cf12"
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
