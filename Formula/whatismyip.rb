class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://codeberg.org/PurpleBooth/whatismyip"
  url "https://codeberg.org/PurpleBooth/whatismyip/archive/v0.15.15.tar.gz"
  sha256 "7e19014be6c243b288ace7c2552e298696ba6b06091db3a9a83a9b3c01579b73"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.15.15"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "177d695a05dab78c7fa121afbb9f9d25c91c01d3f1eb93c3c240ee238d3bd7e3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "cd465500d5d8fdc06113789afeb8fdcf1fd8b7e804e5893c0b2df222f96d7916"
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
