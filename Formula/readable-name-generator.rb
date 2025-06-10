class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.69"
  sha256 "007fcaad93bc855f38bb41fac7100e7d5c28cb7e0604936cdcbe270759fd1395"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.69"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "62a02b5d8a409e48bc250c850e9d9de63c617adb5956e0b936686ac2a48789bf"
    sha256 cellar: :any_skip_relocation, ventura:       "0136f46d2790e5f0b43b41b9c2d35964b53d677ed1d2e9f38cadce96e6c74cc0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "73eb5cfbadde73f8edcb24342eec0068c1eaec2a798b203d93b66094d3c804df"
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
