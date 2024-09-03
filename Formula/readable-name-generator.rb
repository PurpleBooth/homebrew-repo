class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.1.7.tar.gz"
  sha256 "95b098e1981df7904d7c2df1158c410c62ef05512101bbb5ffb0cf81700bda33"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "3fb4f5842f085eba09e742816f150bfbef1e37a6cb9320a6d620ed4408b823e4"
    sha256 cellar: :any_skip_relocation, ventura:      "94b188bc50d45dd53e1a323c1b27d629b9c085789305bbd0fe66310c3e891d97"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5b3ee09d4839b0efe6c8919a24ad9f851d3a81925340e7440cadb84c1b929345"
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
