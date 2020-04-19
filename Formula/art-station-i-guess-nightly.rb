class ArtStationIGuessNightly < Formula
  desc "Download art from Art Station for wallpaper"
  homepage "https://github.com/PurpleBooth/art-station-i-guess"
  url "https://github.com/PurpleBooth/art-station-i-guess/archive/v0.1.2.tar.gz"
  version ""
  sha256 ""

  depends_on "rust" => :build
  conflicts_with "art-station-i-guess", :because => "art-station-i-guess also ships a art-station-i-guess binary"

  def install
        ENV['VERSION'] = version
        system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/art-station-i-guess", "-h"
    system "#{bin}/art-station-i-guess", "-V"
  end
end
