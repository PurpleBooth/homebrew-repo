class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.37"
  sha256 "94d16b47f14e946fae37b763b642f91b15a09fa53c4539b77cafc8d1b24a6178"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.37"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cd75a66ff8f02b9021b9a90575b099aac8f054c2a2fbd400d4ff0e7e251859f3"
    sha256 cellar: :any_skip_relocation, ventura:       "a5b5a80e63b693986b2da19c32eb55111b2fd2003eac96698c6b2824be1775d5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b607f8642b803ee101b660c224fa2d40f301ba05e3e4ee72a9223a4dd643f07c"
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
