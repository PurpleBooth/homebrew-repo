class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.13.10.tar.gz"
  sha256 "157a2d315fa407142a4eb851c4fe7e4ee71f3b177e12e4513047cca400d87f81"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.13.10"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "11c51cf3af1bae461cb136084045651b12d34c34ed679243b8c956a7c97cd2b3"
    sha256 cellar: :any_skip_relocation, ventura:       "2f09a837b3b66cd4c03670d8c4a5872f911e3f7f855ade0b5acce07ef960c42a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4c77b445cde8291a3e9a00043070ef96086752914b5b64db9459f971726d6dde"
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
