class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.49"
  sha256 "1a5c2906722892114f6e2b7f5b075d3ec16ace1e9b8036fec660558f28f894dc"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.49"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7b971f1a980680bfb994b25d95889c8157ff94dec7188728d24f781f6082550a"
    sha256 cellar: :any_skip_relocation, ventura:       "8ebe725eb4f0a6b90ed8c3b39f1b42f6fec10dee14e1b56ff651ae755e6d61c9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e0107fdfe1b80e92b119bba31aed50c87bb041b9794794879c66979d762a831b"
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
