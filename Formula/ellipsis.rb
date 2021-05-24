class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "453ed371c9d2512ab7fcaee54418ec86bccd8f62b5cf3a37ae5b70f19c538d13"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.1"
    sha256 cellar: :any_skip_relocation, catalina:     "c1d682563f75390d84d83f68a043cd3b9eccc207f4a3cd7133a913ea2e38fa90"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "774003cac767865d91900669e1127769f897533bb2e618827facf60d650176bd"
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
