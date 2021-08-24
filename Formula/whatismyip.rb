class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.11.tar.gz"
  sha256 "67ad210a09928f2dee715710871941756611fbbed7d2778506864fe79929adb3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.11"
    sha256 cellar: :any_skip_relocation, catalina:     "941931ae4fd1383d891833fc01a06f6abf1d81ff3720f38a7936abaa09425527"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1f75f2c47d2bef1dd5c78727d4742cd8b7eecb7f8a3a139554857247d9457caa"
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
