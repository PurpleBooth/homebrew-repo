class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.42"
  sha256 "2c102c9477759ebe9a3d3e47ef026988764156be2a5e6a9341dafaee467dc6e5"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.42"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5dcf21c793ecda96d5dca92d943c34f1e5e315ed8bb63b21af4770ed6e8dce1e"
    sha256 cellar: :any_skip_relocation, ventura:       "1c2e952f2c6264e0b40efa4eab1110f36747f80e366414d0ca5b842500ac01f0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "474a3277a8452a4eff9ad35aac34c6dd84b86533c7e52be237599b49908ea1a1"
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
