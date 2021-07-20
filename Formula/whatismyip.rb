class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.5.tar.gz"
  sha256 "286e3c46f8ea8f9a35c1200121ddef6e286b2866516b310b716014bb1ad116f3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.5"
    sha256 cellar: :any_skip_relocation, catalina:     "5d3820d5a15f6c1085a00b87a25c2279cf29a0ffc5e7147ed2e995760500f482"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3e83602caf96f7df0d96652be6b69bd20365cd162da4d88635f2807384a86bfa"
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
