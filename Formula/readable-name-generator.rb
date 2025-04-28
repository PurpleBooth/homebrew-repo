class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.55"
  sha256 "65069b0eaf34378b961a70d35f60db014aafc8c86fac3598574b269bba9c9aca"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.55"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a9ffc80094c9460c7b551588f8bdc8a8fdfce50f227aa1a88f400bf42590a0f9"
    sha256 cellar: :any_skip_relocation, ventura:       "8f47fc412f0197bfd548e931bd1167ab4d6b97bb06be7d24702497a95b16c380"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "91d87d22cd616a799a667ab6e3421067074915745010cd484f2773de821d7878"
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
