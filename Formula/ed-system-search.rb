class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.0.tar.gz"
  sha256 "98175de15b6c9f4480e84674b20574a0b18624d32ff2ccea195a85554d423916"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.0"
    sha256 cellar: :any_skip_relocation, catalina:     "fdfb492aaa60f3a5223099c8abf142fdeb907de0355b6642652b5b879e4ab54d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "43b55c226eda2fd8b44694b716aa64150cc456b6aec22087446e832c43730ab0"
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
