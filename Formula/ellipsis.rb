class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.22.tar.gz"
  sha256 "5914db8de7175e5279165f626cdf103eab73dd4dab9374a4a349f0a26d196454"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.22"
    sha256 cellar: :any_skip_relocation, catalina:     "853fffa575be4fb4b5295a338e91b779746371257f6d7944dd81d38df57072d8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2fe14af798ce16cba05df5e3b2f0948b50d48e13e6f7ccbb95251e14e2b8fb1d"
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
