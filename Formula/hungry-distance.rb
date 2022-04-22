class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.30.tar.gz"
  sha256 "601d32acc845b9418561292987e1ba61717252d4a7255f2930981b7e8baa95ce"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.30"
    sha256 cellar: :any_skip_relocation, big_sur:      "feaaa4f5861c3f1929029161ec4c4d66464afc1d3e0712e7dbbbd5da8db36ced"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ac2f04997d24794888b531993805aa039f0904b0815c5b4ec6c8623e00d20ab5"
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
