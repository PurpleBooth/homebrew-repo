class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/refs/tags/v0.49.29.tar.gz"
  sha256 "22d71c64dde658967036b1d856118595def4f10c2bde2f7924e3b9731ed3c2e9"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.29"
    sha256 cellar: :any_skip_relocation, catalina:     "c96989d8b68e8d69aecf1946ee69925a0900e6eeb0f5cfa5e187136b77497a52"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "29b2ceefa4276a10cc4f248de8c962931a5f9500b571c252a42da639903e1e0e"
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
