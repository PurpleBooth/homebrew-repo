class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.15.tar.gz"
  sha256 "70eccc0a904dc68e252222b16e188e8063c7eae4428702f147c9c9e1f13b4e35"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.15"
    sha256 cellar: :any_skip_relocation, big_sur:      "f1e8dfe11f30b5f928e691929523b7c688a2f898496b28e9185d11d020cb61b9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cbe66e72fcd8dac88a53e25d9b7c574f9b865c0a7b2b465aeee2adde1e15e928"
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
