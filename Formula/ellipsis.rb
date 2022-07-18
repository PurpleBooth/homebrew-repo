class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.53.tar.gz"
  sha256 "959b100673e20a83320c323791daa02c287d140b2df7c81dd6c4d41e2bf0cd80"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.53"
    sha256 cellar: :any_skip_relocation, big_sur:      "17d77d3477a7b40959d90293980f4d4636a4aa88b814ee4cfba0224ae1271c26"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3f4e4257246a0b0fc0f097b571d77f3c53ce29d4d89634d4e6c3a5b2f68d0689"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ellipsis", "-h"
    system "#{bin}/ellipsis", "-V"
  end
end
