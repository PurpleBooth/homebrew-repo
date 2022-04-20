class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.40.tar.gz"
  sha256 "cd357a6e544a06a7ffcb0719d7de91609fd07b3d9178e017c60f8a05c884eeca"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.40"
    sha256 cellar: :any_skip_relocation, big_sur:      "daeb7de20bde5ace7b3dab5ea3aa54f30cd58f6a213d868facc6304091bdaf0b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cd3711f773003f6d94657e75340956b58e2634b64a5b08e6b9fd83eb44fe1365"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ed-system-search", "-h"
    system "#{bin}/ed-system-search", "-V"
  end
end
