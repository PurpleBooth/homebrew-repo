class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.28.tar.gz"
  sha256 "82881a8fb7c11fcb02fbd005093c0f21cd76bcacca770d75024b3529f1700047"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.28"
    sha256 cellar: :any_skip_relocation, big_sur:      "d481d389eb312083a9a7405d6d4b8f6096c222f685ef8316e0fa57ec26106680"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "167f83fe95fe924de339af47548c11dda428ed46c34443e98294123b3d192881"
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
