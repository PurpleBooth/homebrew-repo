class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://codeberg.org/PurpleBooth/whatismyip"
  url "https://codeberg.org/PurpleBooth/whatismyip/archive/v0.15.14.tar.gz"
  sha256 "1f73a34b5e1846345589048b379ff7f10bd66bd2c3fa94d2dec6041e9cdff8c5"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.15.14"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3a3f61ea33e1c2c9a061c81f1a9fe2cc2ee316a422056e1146819b64648c6d89"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "17632b31130d550c3c2a93e3d613357f3db9ac7668989403315ea4108ace17b7"
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
