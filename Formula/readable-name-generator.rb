class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.53"
  sha256 "3728bdaf04245832a4af855cf75d84f0935ea752b30e3d73f3bf7e95f09d93aa"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.53"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8cd899a8a87bd5c8c4f4dd54c2ec5df731b6ab3f76b9ccc70934a37daa932bd4"
    sha256 cellar: :any_skip_relocation, ventura:       "a481d6b9b5a7c3b8f86579b1c46095d5f15444867e231ed4da98e68e580bb394"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "9965007a4b7f3e1e1741e8100ed258db22ed8af823a04e5a48bf8bcbaa6ec824"
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
