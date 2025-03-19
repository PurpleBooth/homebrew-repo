class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.43"
  sha256 "86c0f9c6cc680ab23670594e6821b3b11985fdf335dc5b64e42fad01f1542b28"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.43"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1b9a1e0354cde262a1e4ff99b57225abd7cbb04572ad786ea43bf4ea3e54120e"
    sha256 cellar: :any_skip_relocation, ventura:       "a0e4a18a2dd8ecb7552631dffd49f77993892b6b77cc4399786f435194ae96c2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e75af7b86a2095008f27459ede61522d5f8d1c867a330eb8f166fe34115a8af4"
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
