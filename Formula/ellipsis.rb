class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.14.tar.gz"
  sha256 "1648028f2c5c11d57028067aad880b52fa0449a8433a79f0ec6aafe9bfe7c337"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.14"
    sha256 cellar: :any_skip_relocation, catalina:     "cb197d279603e8afc71171d58abfaae9ab3219a4e9af1e900833e6be735905bb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cdda1ca0a64cd9047c123871379bee3a91cc0a79c3e2d13c7f03112bfa1e893d"
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
