class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.13.7.tar.gz"
  sha256 "8efa716aaabf462535d2f7af0a8d8a103df71bb2bbfbe6e64273c8675fd4884f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.13.7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0f40e1f47b3f68a505041ad7eafc34949533fbe369934de4bfdee59204b09ced"
    sha256 cellar: :any_skip_relocation, ventura:       "1f3f37ccca49254faf5ba7e6350a86a2a3d7f69a0615f4a62c56dd8af15dc5f4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a47c86b7c2ff02f440863c214a7c91318eaa6da38988561ae15548b8951feea0"
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
