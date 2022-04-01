class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.27.tar.gz"
  sha256 "3544da904aac672dae0e11287d8eac83a80f4d92f8072cee62da81bd6afbe5a6"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.27"
    sha256 cellar: :any_skip_relocation, big_sur:      "5bf402c0d12a55b3cfe91dda9ece9c26699d9d151898f0f2c1801f70254708c3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "81611249377928b9b85eb8906491ba80f4e66782f704a1ac2a2fa106d8bf1118"
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
