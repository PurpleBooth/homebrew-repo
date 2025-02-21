class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.35"
  sha256 "07024db15fd39c44c39cfa9a76b2dc2a4fbbe61bb568d9b1ce671faf9376adfd"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.35"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "48d5d91cfd89656328df993dc2ee1fd4e2485cc5fe7f5ca56b2fbbe879eecbff"
    sha256 cellar: :any_skip_relocation, ventura:       "60f9a0c168d1708ee574b65c35153f4a1e8c5f055bd929eb01582c8803a6ca06"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e48271fb79e493ecf89eae63b2e7d7ff9aeacc8bfa923225cf49186a04d64a7d"
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
