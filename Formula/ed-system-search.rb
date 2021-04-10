class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "202fa2c508c5b06d74de2c9e47569e0bfd0f54445284286cafbfe84253302045"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.4.0"
    sha256 cellar: :any_skip_relocation, catalina:     "c4fa706be4b4cea3625e77cd23c5d14a5d7b110d221601659868382a6631ff77"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "85a67976a529f8f7769e8a16e3ab1329300d53bf30545a9f1aecbc8adfe101cf"
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
