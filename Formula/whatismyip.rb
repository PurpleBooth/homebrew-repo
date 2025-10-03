class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://codeberg.org/PurpleBooth/whatismyip"
  url "https://codeberg.org/PurpleBooth/whatismyip/archive/v0.15.13.tar.gz"
  sha256 "d66337f34876c9ec71c9b3813e41a99ffe4884ad55bf43eb9a7bdfd63657113b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.15.13"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c02851b8da0d7dca566192cac15dc5ba369c63543b5d5237aa388d69f3cbec35"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "09fd2cb146fd7743d7c92b6c263c4a5379f7ca2b6a8e60ab28e9c38de3740f85"
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
