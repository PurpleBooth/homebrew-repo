class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.16.tar.gz"
  sha256 "63766c39bf1b99e8964a5d2b1bea450be05a4c0e6c3bdc0cf8d4bbc46740fa56"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.16"
    sha256 cellar: :any_skip_relocation, big_sur:      "6328414270fde94f57f48338b1e92f6f19219e49115b9fd67256bc7f3c0963e4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "84522d03b6966f0b68946b775ee703742c1a1d8ef6fb04d3685911773e016b92"
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
