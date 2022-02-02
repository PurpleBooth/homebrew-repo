class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/v0.49.39.tar.gz"
  sha256 "bd519ddb1484269c8bbca5352c857efb174e4a766fdb33aea8135781df1ebfe4"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.39"
    sha256 cellar: :any_skip_relocation, big_sur:      "13b6a9afc44745e6f7340881944bedcdf22144da23075f69d352cb8053ac5757"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bbde73b09fa25435dbb8e5fb038d2ede982146590930a5ec58fd50d092703808"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fix-gnupg-permissions", "-h"
    system "#{bin}/fix-gnupg-permissions", "-V"
  end
end
