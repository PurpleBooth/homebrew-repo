class ArtStationIGuess < Formula
  desc "Download art from Art Station for wallpaper"
  homepage "https://github.com/PurpleBooth/art-station-i-guess"
  url "https://github.com/PurpleBooth/art-station-i-guess/archive/refs/tags/v0.54.0.tar.gz"
  sha256 "977a7740de5ed4b50e7bdab78c9bb8ad9dc860cd735753de5fb6faddec577e3b"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "1445d911aaa95613132f3d1ecbbde6c742118b2d03fef02bbd7ae7f065d79804" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/art-station-i-guess", "-h"
    system "#{bin}/art-station-i-guess", "-V"
  end
end
