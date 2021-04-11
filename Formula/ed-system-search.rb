class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "563d570260f5a9ded1ac122b7283bd39f00662f1bb69d063e7b15ee1443f52f0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.7.0"
    sha256 cellar: :any_skip_relocation, catalina:     "c846c90a99f460aceaca65fb2ec2d44bcb1963d0adbad863fb2fa4d6e7c36bd4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ac53677697537eb892024c73aa5a6b717c1af3b5c1732b8d7c769ff90e236cae"
  end

  depends_on "rust" => :build
  depends_on "zsh"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ed-system-search", "-h"
    system "#{bin}/ed-system-search", "-V"
  end
end
