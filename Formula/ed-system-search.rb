class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "2d8c4a6e5b5d9ba9e2c82bb73d0529b12d0896fb7dbaaf574e4139288eccc06c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.1.2"
    sha256 cellar: :any_skip_relocation, catalina:     "546d0a85d5e0ed92978af62c482cccef3c298e0c765a372a9ed3e136d60f6ff3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9ad7e045af79696c10adda36bd64310137783ab652f1c22b7d0a4a92d2921f7e"
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
