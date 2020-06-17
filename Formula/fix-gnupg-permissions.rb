class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/refs/tags/v0.37.0.tar.gz"
  sha256 "8d9aa5b35a90528a03b4691f3a49a625978a6ded2b21cd0782a4baaf519f77f9"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "43932002b053c8129da5ffc1b167f41421229ce807ec99b970f5e946da082292" => :catalina
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
