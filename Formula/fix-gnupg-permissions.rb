class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/v0.49.35.tar.gz"
  sha256 "68793736f536781d9e5e3a7bedf1a9e5d37767fd98473ebeb627a5b26ba6e79c"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.35"
    sha256 cellar: :any_skip_relocation, big_sur:      "5df1b3e9f29cdc292f14aebae6abf209674a1a4f0bebec1a668a3aca6148b1da"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4fdd40f27c7db8b07ec64e460518957e455ab2eb7f8626df9f3db012cdaaabb2"
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
