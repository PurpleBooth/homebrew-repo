class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/v0.49.41.tar.gz"
  sha256 "4e8e9a9ae450773dff7a683f32262f3e02fcc34c91b0dea19bff919cbeb2bc6c"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.41"
    sha256 cellar: :any_skip_relocation, big_sur:      "a1709426027072fe7952cbe8a10d994acad28ebd49f82021920a04c7c3350aff"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b94d378df429e092a9443636cfeb922c56d4e6307d17ff096194e42c7b87999f"
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
