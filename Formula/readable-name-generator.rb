class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.58"
  sha256 "a13963afca3b123a4d32025ff139b9e5352f07aced890406ff465e7dd7408c54"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.58"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0dd1d78e090ba817b8b3d478f920e68f7544db08cf6b160928977b981215043f"
    sha256 cellar: :any_skip_relocation, ventura:       "f34a126938cce16aad5305c5d69601eb1c39e9dc0a0c6c0992dc28ef7869d49b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "cd2e60f0db7095c7d32455241f67d8fa78cbd24be913c266b0c309be517c0e87"
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
