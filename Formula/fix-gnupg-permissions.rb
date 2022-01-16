class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/v0.49.37.tar.gz"
  sha256 "910a945303abddf05add436799a4704f97eced62dc36ca2a363b6bbd661b6b09"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.37"
    sha256 cellar: :any_skip_relocation, big_sur:      "1fd43a445ccf9cd358fdb0e29c96e4b2987f7ed08c45e6f7e373324442314a37"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c53e156d965abeaa058b3be50a1d923b8e77920fd968fd561443a4e15268f217"
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
