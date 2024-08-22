class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.0.3.tar.gz"
  sha256 "91c6d3e451f7e28ae02edb3f20bb68dffe4fd5c663dfe8721b0aecaeb6ea7dc3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.0.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "356115e0aa07f533710fccac28945edd7bd580cbeefa053ac25133dc9acec804"
    sha256 cellar: :any_skip_relocation, ventura:      "833f9d5ea289a28b85a10fe5e0473fa3db644f87dca745f476fdfad10c4918e1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9ba17224b692208a108067c923d53d3ff265ce8f8f43d6bc746646c404aedd31"
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
