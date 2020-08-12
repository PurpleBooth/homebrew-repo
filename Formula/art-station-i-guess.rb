class ArtStationIGuess < Formula
  desc "Download art from Art Station for wallpaper"
  homepage "https://github.com/PurpleBooth/art-station-i-guess"
  url "https://github.com/PurpleBooth/art-station-i-guess/archive/refs/tags/v0.80.8.tar.gz"
  sha256 "3fea911fd97de6e6f81fac2d479593e8255c8568c704083cab091b8f3f2e65ea"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "d71131dbf273ce27829d709cd7b972e2e518e8d7697ee92cc31c6769dadaad11" => :catalina
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
