class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.6.tar.gz"
  sha256 "ac3024929f275a0bb9d0f9a45c5f235b4d00c815be4ac0cbb96c9a0925d11c1b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.6"
    sha256 cellar: :any_skip_relocation, catalina:     "ca61796d67aad230220e9b8fd1028f0b8cdb030e6be3414c7650082388b1e958"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "702140eb5e4dd98814053fd71b5fbf6275a37be371d0d31a0406f14f6c5106c3"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/whatismyip", "-h"
    system "#{bin}/whatismyip", "-V"
  end
end
