class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/refs/tags/v0.49.26.tar.gz"
  sha256 "9cb80f920a6917595675a0c9e2918f35a207a4160a50e328985ae3d3a45af8c7"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.26"
    sha256 cellar: :any_skip_relocation, catalina:     "564a345c150ef6aa01a15d75bcb32469bca26e042214ce921c62af8bc9e702ae"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e5b13e6cfa5fa62390f62b35ef876e4b8206ee0e650ee902bb316e8d0ef83e2b"
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
