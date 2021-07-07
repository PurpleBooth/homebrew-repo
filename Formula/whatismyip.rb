class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.3.tar.gz"
  sha256 "4d43d72fb33e06a234e6d90b4834a7cb7eda6b93ab91efafc3b07a46fc580949"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.3"
    sha256 cellar: :any_skip_relocation, catalina:     "1f12455aa8d9c5490c878a525bfcb6458de4d1472f50b2b4fcf6d40c67b53bf7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "be8147c8ab3519a170aeb232c5d784ea1ab4d76498048af793fa230331b7ba25"
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
