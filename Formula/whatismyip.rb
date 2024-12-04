class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.13.9.tar.gz"
  sha256 "2201f4a4df64b70fc88973077821ad7e51b83a0fe05822e35b4acdccc1fb27fc"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.13.9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f07be9f4d3a1e464a29dd0f755fc565018acc31f4f2beee05b7055b8d98c0c75"
    sha256 cellar: :any_skip_relocation, ventura:       "248089a520ff029e21df6162314e70c87b96bd2c1c7cd76b58b3105ab96a5655"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7a8afa241454e6a47af0fba947c474876d0e5c1d46388d9aa5ef0d018837ca6c"
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
