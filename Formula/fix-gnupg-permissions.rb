class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/v0.49.43.tar.gz"
  sha256 "1f13a7a3fcfe5fc77b23344b60a3bdb0634c52714947faafbf56ecd83d3904fb"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.43"
    sha256 cellar: :any_skip_relocation, big_sur:      "8be2e2fd4967d4cfd4b32ae1b9e110faae5d42b13442aba0f4ccdae0b3c2cdfc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e6182f629709ea607b7cf1f436685656bb99438dc4c4a3f03a9cab97721f05ae"
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
