class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.33.tar.gz"
  sha256 "58071aa6c6e3c6f8df3df382b9db6918c2f008e0fe55c65f26fa5c1fa3331b8a"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.33"
    sha256 cellar: :any_skip_relocation, big_sur:      "c1bb443946e9b7ff22821df4f6a67b93c7dd57a666fc5b58e388fa82c644ed66"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cc1b0e31ab4fc0a06d5a12ca154118cf55bcd2ff6c11dcab5039fed827e8375b"
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
