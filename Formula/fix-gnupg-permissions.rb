class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/refs/tags/v0.49.30.tar.gz"
  sha256 "7e55a2004b5ee93b57120473d231336fd0428be88b6c3beeda42f7dd43a2d103"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.30"
    sha256 cellar: :any_skip_relocation, catalina:     "b747206f3b63bd8e4cc12c4700ba7100a55d481a38098ff7ab58c2865c25cd3f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6a38e3fdb3cb0bd2acf2e647de450877dfcdac7ece4d9e713a12477a219dd7e7"
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
