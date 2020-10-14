class ArtStationIGuess < Formula
  desc "Download art from Art Station for wallpaper"
  homepage "https://github.com/PurpleBooth/art-station-i-guess"
  url "https://github.com/PurpleBooth/art-station-i-guess/archive/refs/tags/v0.80.24.tar.gz"
  sha256 "b6b3158773dedbb1bcbc0e0f6ea597d2129ec57c2e22a5604684b097d66bf465"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "d8c1393e47e09a0a8833268769ba835fbb10aea259eb6ebbcc8ce412d7c7c345" => :catalina
    sha256 "207011b5b8a2ae81976f5047d994f50fbefa9013a375b76f5e211b7542d7748e" => :x86_64_linux
  end

  depends_on "rust" => :build
  on_linux do
    depends_on "openssl@1.1"
  end

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/art-station-i-guess", "-h"
    system "#{bin}/art-station-i-guess", "-V"
  end
end
