class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.22.tar.gz"
  sha256 "73269fd8146aea05922f60a693d4f5dea8b20eecce5d1c524c7958b42bac7e9b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.22"
    sha256 cellar: :any_skip_relocation, big_sur:      "bdfe88fb101bf06dd9b4f6b8f8b8ef3a2bde215def2d2615d1f7e04e88181e1d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "18094d17ce04eab05cb79f755a14c45c492130f3d5fcf3106c5542e7a065121d"
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
