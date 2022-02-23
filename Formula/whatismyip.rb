class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.38.tar.gz"
  sha256 "54b50dfdb85b80596ef3c71d0ac3b3db9a3849762ab533f70c786c052a9fc57e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.38"
    sha256 cellar: :any_skip_relocation, big_sur:      "2cc78cb97e9d1e02d24d1c393ff065ae38357642e3819e35a87966d8fc9cafa4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "508b2ebdbe045ba098b87177882985b6ff015bfb555ba3e93f3e6bc7a7d2fcb8"
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
