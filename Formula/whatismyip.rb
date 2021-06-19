class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.8.0.tar.gz"
  sha256 "15562b6787d1bd9bedfdf8c9e64292092b590233a2109d90facb0a3f98c78bbc"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.8.0"
    sha256 cellar: :any_skip_relocation, catalina:     "26fdd9cd539775ae7e32200786dbd5d72d4ffafbe6764a8129aee9e659575843"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7a2086003ba881fb8f64ebf3ff9019154c3b18bf96237ce111604799b7c8dc44"
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
