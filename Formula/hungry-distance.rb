class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.37.tar.gz"
  sha256 "5f894cb729b116d7c3be0b910e8f4c97f29a3866b2b3f55e7f10e7649afc20a2"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.37"
    sha256 cellar: :any_skip_relocation, big_sur:      "4d8cb9fe4d70a73a8b02dbe2642cf8c4c91139161ba1ba77be1ff54088246c9d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "92fee4bd3dfcf703aba36d95607aa46f9286f498f18109debfde33f97504712d"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/hungry-distance", "-h"
    system "#{bin}/hungry-distance", "-V"
    system "#{bin}/hungry-distance", "--", "-11.46875", "39.78125", "22.78125", "73.875", "-3.5625", "-52.625"
  end
end
