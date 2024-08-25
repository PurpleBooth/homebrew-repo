class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.12.2.tar.gz"
  sha256 "0244c4970a6fd7e0d4df1d4db064012f32e15508fee16a7eeb8bc129002463b8"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.12.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ca111018a020c40a706c891e6990b4bd222fcd2362e9ab52253841d4ab691775"
    sha256 cellar: :any_skip_relocation, ventura:      "b1cc1cbbbd0fffdf5e50afde7aa32f7d798b68f0863e1bc11335f453bfad146a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f248d9e47d889579b693005a47ef103f698ba00e0947492d23b637a0d086a7ad"
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
