class ArtStationIGuess < Formula
  desc "Download art from Art Station for wallpaper"
  homepage "https://github.com/PurpleBooth/art-station-i-guess"
  url "https://github.com/PurpleBooth/art-station-i-guess/archive/refs/tags/v0.26.0.tar.gz"
  sha256 "f50d4fce85a424790d428e81238f9b1fa78d45f73d54d70657010f7394e3fb1b"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "af1033bb6d467e21171637b0439d03baedfe13c23dc47ea18f6a520d4ce9da42" => :catalina
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
