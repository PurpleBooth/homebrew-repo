class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/v2.100.33.tar.gz"
  sha256 "d1d7a5cd65635610eba7e50ef2b345e5eb894759a8bd926920429c4faa83834e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.100.33"
    sha256 cellar: :any_skip_relocation, big_sur:      "7decf63b1dcc465e9d3660f69128db294eba6b995d84fadb669434d1e4a02f75"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e2fcf91fd3fc7a6db80403747597125f4b63da0d8ca407aa68421f039cc30776"
  end
  depends_on "help2man" => :build
  depends_on "rust" => :build
  depends_on "specdown/repo/specdown" => :test

  def install
    # Build binary
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."

    # Completions
    output = Utils.safe_popen_read("#{bin}/readable-name-generator", "--completion", "bash")
    (bash_completion/"readable-name-generator").write output
    output = Utils.safe_popen_read("#{bin}/readable-name-generator", "--completion", "zsh")
    (zsh_completion/"_readable-name-generator").write output
    output = Utils.safe_popen_read("#{bin}/readable-name-generator", "--completion", "fish")
    (fish_completion/"readable-name-generator.fish").write output

    # Man pages
    output = Utils.safe_popen_read("help2man", "#{bin}/readable-name-generator")
    (man1/"readable-name-generator.1").write output
  end

  test do
    system "#{bin}/readable-name-generator", "-h"
    system "#{bin}/readable-name-generator", "-V"
    system "specdown run --temporary-workspace-dir --add-path \"#{bin}\" \"#{prefix}\/README.md\""
  end
end
