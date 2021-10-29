class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.17.tar.gz"
  sha256 "a61783b9dc4fc4da8e47c1b62485a448457efca2167b3691424f824ba4799c57"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.17"
    sha256 cellar: :any_skip_relocation, catalina:     "ed8406aabb300f0ca62aba5972727027cac2c5d055d97846fa555d7b473a07ff"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f7908d0dd346bc3509ebd408f3c704025714550556dfd68a84f9bc7852d97c18"
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
