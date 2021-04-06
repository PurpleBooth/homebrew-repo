class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "7cff07218e811daaf37c2cc8136e9ecef15850995eff920dc5cca4d3dc665e50"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.6"
    sha256 cellar: :any_skip_relocation, catalina:     "6423f4177ba63d3e49d3cc6899876100e1f05c4111813b752d4c47778520a91b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5d4b17a62e06403b34340039c839d015e789a910b5579330bf105968a2679de7"
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
