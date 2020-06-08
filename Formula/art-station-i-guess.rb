class ArtStationIGuess < Formula
  desc "Download art from Art Station for wallpaper"
  homepage "https://github.com/PurpleBooth/art-station-i-guess"
  url "https://github.com/PurpleBooth/art-station-i-guess/archive/refs/tags/v0.24.0.tar.gz"
  sha256 "a15cdfab180c2928a5bd77e882431d2336ceeee7fcced1d2e7fb0881d4e2baa8"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "2ef8aca51d9761fea3b122b2da63d7c63c98e123e10a16d67a4e68761ca3557a" => :catalina
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
