class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://codeberg.org/PurpleBooth/whatismyip"
  url "https://codeberg.org/PurpleBooth/whatismyip/archive/main.tar.gz"
  version "0.13.12"
  sha256 "402c0f5fd5fb278e133f1f779c8125b22f7bead25e5a17d04fe63c2144ef0fdd"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.13.12"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6482d768f1d40f94aa35e485aa6ded8a243cc3d629b17525758431e67f12cb1a"
    sha256 cellar: :any_skip_relocation, ventura:       "f4d9a05f1d71725123316e87552092f36e0e84812dc42841ab79fbf4b3f43108"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "16275d984b4611b06d73f6f0e85f26bc823f2ea7546fe322e1349a055f05fa57"
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
