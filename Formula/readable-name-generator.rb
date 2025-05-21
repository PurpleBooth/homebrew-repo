class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.63"
  sha256 "cba49768a0c392ed577b73b7e52671730996e91cbfc28e5b5a125beedcff8f70"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.63"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f64276b9ae522d06d9eaf38d508a5922cecb760f4ef99eadf48aaaa55154cde4"
    sha256 cellar: :any_skip_relocation, ventura:       "2f2aa8e7756786244f5306ee850ccd2c9457126c99aeae77035724a102a06354"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2a79bda9e21cbdfcb734737068f92c5d7f183d0e153e2d9247aaf61d812274cd"
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
