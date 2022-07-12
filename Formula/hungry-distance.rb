class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.35.tar.gz"
  sha256 "c0070e0dfc3724a644665a91250d7a8173c29c50311a7244a9c01576071c3f22"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.35"
    sha256 cellar: :any_skip_relocation, big_sur:      "43abaad9f0c0fc4a0ab93b882eed6628d4de5a82e4738a4d1d27b7f8a3b27c9b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "add44644b2cd1d8c63be28d44b614c45c9331aec0c45cd716f4dec35a52abd90"
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
