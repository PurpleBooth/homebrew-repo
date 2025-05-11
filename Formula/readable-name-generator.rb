class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.61"
  sha256 "f42bb5f4f8db8d76d4437de09e790aa87c575e5dc21ace174b554182713f4c77"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.61"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "864a963267a762b622f2dce825888bc13c6193d3dc6ededf403eebd29186b1df"
    sha256 cellar: :any_skip_relocation, ventura:       "46775e4247c97e38faada3cee8b7437e1ba023ea340478377ac604078fbb2284"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f7432241a199f54b41617d8f3e492c91fb5c40ecca2b27e8240ec55e0a3f8b66"
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
