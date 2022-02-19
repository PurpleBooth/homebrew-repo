class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/v0.49.40.tar.gz"
  sha256 "850ff4a75cea05c99a382b931688e42a5cc0fa5996e5fc607e7826fbedbb8a4f"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.40"
    sha256 cellar: :any_skip_relocation, big_sur:      "220a9e89bb8e690bfaac3be29c587ef9ffde7ce0c1c0cfd7f9d8a20734f541b0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "617b44b7c233ae8096960db46578b988b2eee2d55adb3d73163fde0dd8ac744d"
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
