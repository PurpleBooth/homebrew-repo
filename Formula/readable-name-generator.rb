class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.41"
  sha256 "2e7023b70c5939879a48162f3bb77dd477946c2574db79caaad608d0b5fcda09"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.41"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a2e95edde93064870608ede74a0466f67c81364c4131920fc32ec112fed91173"
    sha256 cellar: :any_skip_relocation, ventura:       "b65c03b1675c1d01d63e79de417d248876b40339a1c3b3b6dcde99f7384901f9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "31180678f35a3502af686b807d6f4578be58f4d5ad4504b7ccc2cd78d8fdcba5"
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
