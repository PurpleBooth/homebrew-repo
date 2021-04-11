class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "54b838d4e902f8002aaff5c89114e63d12f0650cd45564cfe4f76db32b83c25d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.10.0"
    sha256 cellar: :any_skip_relocation, catalina:     "4c22d75737f5cb1425218b1624df4da1fc9539c4b6fb47c73687aa7816172d7b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "65e56c437441c31bbb6c9d5c2fef740fb851bd0d9251dd3f105c759cb871ffeb"
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
