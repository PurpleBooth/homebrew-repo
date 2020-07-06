class ArtStationIGuess < Formula
  desc "Download art from Art Station for wallpaper"
  homepage "https://github.com/PurpleBooth/art-station-i-guess"
  url "https://github.com/PurpleBooth/art-station-i-guess/archive/refs/tags/v0.68.0.tar.gz"
  sha256 "00ae62dcd38e80c883f63108fe43919225c69c26eb9660d7a0a4413326c64886"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "4e47bd779881027e89f5e01f387a56e485cca279335382e21d3a45fbfc4a909e" => :catalina
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
