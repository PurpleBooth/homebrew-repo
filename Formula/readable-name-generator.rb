class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.0.7.tar.gz"
  sha256 "175eb3de4c50a67370e4e791abeca545fa6c060d9bf2d595fa53a8c3cc7f5304"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.0.7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6baf33c08ff5d9e2b8a3cd8c655f62df1e39e942d1545dcbee4db017a42a28e7"
    sha256 cellar: :any_skip_relocation, ventura:      "112284a24bc0d583dc80171ee40822fe5a1cde64a08f0d58e7debe64448d00a1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "092c5a5ff3a6861fe7441a34387db2666dc440e72796bbc194ee73d2248bbf61"
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
    assert_match "gregarious_pauli", shell_output(bin/"readable-name-generator --initial-seed 1")
  end
end
