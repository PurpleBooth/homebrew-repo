class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/refs/tags/v0.49.27.tar.gz"
  sha256 "79e067f4a59a5c4257b137c7acd3e8ad98cbdcd444389979f35239910892572b"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.27"
    sha256 cellar: :any_skip_relocation, catalina:     "591cfe93f90382004bd2cb1cb936c973ce8856d04c756e5ce845e92854022d3e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "949c0209b5993548938b7360ba1ba1f6541a2d9c5651ac0d56f595be2ceb0e43"
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
