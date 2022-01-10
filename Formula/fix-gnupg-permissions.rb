class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/v0.49.36.tar.gz"
  sha256 "31184a740438e22965c2eb76f69c6c2e64eb9b29080761b3f9ccdac01cda6d43"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.36"
    sha256 cellar: :any_skip_relocation, big_sur:      "5da5ba097c5c417302be791cf1e15cb0398a05890177cb3b2a6ffc059f00b98a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b9cef57dc507f1a42cbeda83e8f0f4090fb43466a8cdf67fcb2963bef9a11f76"
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
