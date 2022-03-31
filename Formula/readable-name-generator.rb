class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/v2.100.22.tar.gz"
  sha256 "e2d1530056fe0eab4d635c4071e9c1ec4e4d60ab9bdbb36656b5c8ac372d3c85"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.100.22"
    sha256 cellar: :any_skip_relocation, big_sur:      "b66759e84fdc3f645bf3016c07174d7962330b266d04b537bd8a9c532a0a98f3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ddab626f46fdf68e3f266f0e06538089b7fed9e314564f47a7667195918a56c9"
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
