class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/v0.49.44.tar.gz"
  sha256 "2663a0a09c562a394442b2c0f2c1d0f0e266d61aba2d03961aed7d6ba8cecba0"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.44"
    sha256 cellar: :any_skip_relocation, big_sur:      "02a0d43cd74ab3a70216d2dd3ca3befeefc765c18af69fb61de5071df971ed3a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c867c79759d0bf2f3cdfaeada2fd67cd9ce278c62125e85bc16997f6efa64628"
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
