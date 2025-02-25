class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.38"
  sha256 "51d394c9c6379c2730dcbe2f0ea67e64f808a21436b8744e28304542e0619bfd"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.38"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9e98f127f022b58717274de04cbe5763cb038eeab541e308f24778a12dbceb76"
    sha256 cellar: :any_skip_relocation, ventura:       "5ee1a356a8a73f834c92e47729ac1c8afd93f09b328fe182fbdbc2db9e3ee33f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "84ac6de5116eb1c0dc536fcac6e9b69867392407e1aff4990cacde4f55bfaab0"
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
