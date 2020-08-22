class ArtStationIGuess < Formula
  desc "Download art from Art Station for wallpaper"
  homepage "https://github.com/PurpleBooth/art-station-i-guess"
  url "https://github.com/PurpleBooth/art-station-i-guess/archive/refs/tags/v0.80.12.tar.gz"
  sha256 "bd79e5cc6f89dfb786f1f1ae32753afc3e0f2286c79a826ec1b531cd0674ea65"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "4b5cb8868a81f24da83236eba7a9e9a5a55335cd858e6228ae5ba9c8c999457e" => :catalina
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
