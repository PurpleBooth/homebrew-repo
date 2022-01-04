class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.17.tar.gz"
  sha256 "8d37b404073fca1e712a05fb8c2407da1231287b9c6689937f14ad1582d11d43"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.17"
    sha256 cellar: :any_skip_relocation, big_sur:      "4423da3464be240a0f011ea94c503967080d5a67692a960ad15cc104b7613640"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "03aed30c09a11583ff56a775c9dcc689ba66387e325d221e28e37d9950841a46"
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
