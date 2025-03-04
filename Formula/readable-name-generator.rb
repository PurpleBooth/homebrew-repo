class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.40"
  sha256 "4dd389109a5bef870a2e87ba0c85085b09f06e81328b4520cf57ae1682f44825"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.40"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1e5c7f6cd904a0240017d81e42ce60cf962dcafe60704b004307e1b51d4352ec"
    sha256 cellar: :any_skip_relocation, ventura:       "46a20d800b8798ba0de6204ede998679504d47fd82170e9f1f9be9bd36d583cc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d0135c44208a582b4a26e6668970e96b3312a08acd33a4d0a84ffdc01aed3f94"
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
