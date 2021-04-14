class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/refs/tags/v0.49.31.tar.gz"
  sha256 "7679ececc0bcd6e12cb25eae5208d538b338be1d5e70bffbf84844e24a605e24"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.31"
    sha256 cellar: :any_skip_relocation, catalina:     "7def1303603643a7d0dc3478ede1aa13a2b5d117da1d553360b4c11e330b3195"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b90d0db456c4cbbabbd8579ec96120ca9e41360e799dde2205a10b8752f0b0a0"
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
