class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.16.tar.gz"
  sha256 "c41e500c5525a3313e4699a8dc5eb9a9f62b053624cffb38940edc0d79a7d930"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.16"
    sha256 cellar: :any_skip_relocation, catalina:     "e23a0e894f42bbb5564a371c95a29c7e922bf9649e3309f45a3a5597a2747d08"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "96204707595305311a0e8b5b7c53c9ddb7232f5dcb6a6a53c4c3146a9a3f5e06"
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
