class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.68"
  sha256 "34f664490fb17232809d4a2731341421b9107e94c34cbbde6b9bbae748a6b541"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.68"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a9f7a137d8197d1cd5585e40aed8a53dd06778e6ea555ca52f0cf67d1ef64ad7"
    sha256 cellar: :any_skip_relocation, ventura:       "01b6bbb0230c2efdf2cc85722f1135b85dc613def92a69acf60d7c47ae55bd2b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "35e97811063a295f168480baef1f03a1a2e9c540bf085b7f57ddc588cd7af93b"
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
