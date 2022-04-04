class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.46.79.tar.gz"
  sha256 "8952a2abd41f5a2e24cdc0f8ffaaa752c070013be1becaba43c86e72131cd19b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.79"
    sha256 cellar: :any_skip_relocation, big_sur:      "67681269c977619539784254b6e17d2129973549a300d6476f0191be63898bd0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9631cbea6260426dd9347852bdca2d5c9da6d0110924d89ab410628f636efec2"
  end

  depends_on "rust" => :build
  depends_on "zsh"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fix-compaudit", "-h"
    system "#{bin}/fix-compaudit", "-V"
  end
end
