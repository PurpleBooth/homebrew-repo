class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/refs/tags/v0.49.33.tar.gz"
  sha256 "7f183a67f5dbdea48f98d29116ef11c3bc11400262e625998f81b07c0e302ddf"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.33"
    sha256 cellar: :any_skip_relocation, catalina:     "a994517de68bce8c42d3548002c0eea8f1c79d2d99f63e77972c1d551b5f0aeb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2c1abbb8d9e1a8fafdb7c20f0155f72b93d81119fe11f2a58e7b8cd24d23d3fa"
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
