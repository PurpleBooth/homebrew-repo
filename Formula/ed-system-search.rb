class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.0.18.tar.gz"
  sha256 "c6ec1ce250a7869824b6497426f8c383195ba0e7f45da64bd09042e96c56ee1d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.18"
    sha256 cellar: :any_skip_relocation, catalina:     "7b4200c56dd57a2f41670568e69bbecc4b397a173de1a6672f9236cd6054e0e0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9ab0ca78c3fc0e6a128cf1e44f5b13536ff33634a0231a489dbed8c2f8e9bf9e"
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
