class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.13.8.tar.gz"
  sha256 "ef69fcf6bcd579811fb2c41e88e03edba7f21947c4ce7cdf216cdbbd9600b2e0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.13.8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ac8f70428861d7ccff8836ffdecbdcb1e8b9c81ec122bf7703d2172bf7dc832c"
    sha256 cellar: :any_skip_relocation, ventura:       "80c4e850ee85f77e92d57c51c96d4ceb03c4b6b2f5e15e280c8f88339a8448fd"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "53d80a7958816761b8cd40b62256ea8eb468b70a6fbbc720b1cad63f082c1783"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/whatismyip", "-h"
    system "#{bin}/whatismyip", "-V"
  end
end
