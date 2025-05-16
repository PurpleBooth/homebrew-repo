class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.62"
  sha256 "f879dc66737723e45a6613ac1586480d5a3bd55f540597dd21a6d4d78a854592"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.62"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "01f8a0891fb1fe98920bc9ab47906572481c37c356a3d9b7a150d5b25d1f454b"
    sha256 cellar: :any_skip_relocation, ventura:       "fe6001ae3739e8bbd34a0e796f5e5242620bdf6c5c66fccd3ef2e124c46b8152"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3427d3a8154b4d72e6d4974cb09b1599afd63988d135428cbd78d9b16d205228"
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
