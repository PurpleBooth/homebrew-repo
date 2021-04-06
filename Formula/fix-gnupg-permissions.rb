class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/refs/tags/v0.49.28.tar.gz"
  sha256 "ddc567c8dd76645654ff69ba6baff8a9fe5542024ed5da42111c94784087ed7b"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.28"
    sha256 cellar: :any_skip_relocation, catalina:     "a2b85add2d957432855970f413e79d9d3546f55f1c51cef27cf9d0918da76cad"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b151ff69d1adcbbb8100b3558f1af32e99da17e8d39621054c0580d6b01cc37f"
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
