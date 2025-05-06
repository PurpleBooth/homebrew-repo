class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.57"
  sha256 "32183dc0e85e057ca3d276562d6c3d0063ec288930dd9c30933a4bb0155daf8b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.57"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fc5938fd86372034d6abb3b17d8bf9f223c32e3b93b7f5c634d59f76aece1e11"
    sha256 cellar: :any_skip_relocation, ventura:       "3d712599ab27a112de8615373a177f3f6afa27daf3edacb15446c498d7a16995"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "fe343123a49565e08df9ca1b28856f3320229ef962185ad9aa5cd003a8df54be"
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
