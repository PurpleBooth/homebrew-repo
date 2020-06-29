class ArtStationIGuess < Formula
  desc "Download art from Art Station for wallpaper"
  homepage "https://github.com/PurpleBooth/art-station-i-guess"
  url "https://github.com/PurpleBooth/art-station-i-guess/archive/refs/tags/v0.60.0.tar.gz"
  sha256 "bb04c15ed7c3f719254b3b539cb9424462f63e60777208d561b1ed259f7bafb9"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "53b93d27a53504582f1c9f3351e07641ea0f6fc1952cb5787d5e7926e95e7361" => :catalina
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
