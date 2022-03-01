class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/v0.49.42.tar.gz"
  sha256 "945b3a40c683ec6bf639ed4bf53a238112d4dfb61b6587066cdf412ed793e281"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.42"
    sha256 cellar: :any_skip_relocation, big_sur:      "4d6c85ba47c2cd2beffc9962a4adab36ba34989813e9f42f9663a03646a6d029"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "29afc3c634a87b50210f64cf8147fde9882fbea92626925311db3a543f29ab3d"
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
