class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/v0.49.45.tar.gz"
  sha256 "0e0573c24ff8151726d509d9e17db975ae4a7aa4fc977e2b1d77318f041c3d43"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.45"
    sha256 cellar: :any_skip_relocation, big_sur:      "211e28d7744c7da9b08bff14aece40b38ef19bde07a0f2f78232a859140a10c4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "330dcca10ca4d6eddc143ca3018f4aba21fc2e27b40b3531ea1667db5da060f1"
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
