class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.13.tar.gz"
  sha256 "2951eadddd5f0b93d6956b23a0370e20e8018aa09e411ef9995ad7910f6dff25"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.13"
    sha256 cellar: :any_skip_relocation, big_sur:      "ba6281ea8e7d5a941e5353d4600a63c0deb9253a5b3c7529ce765ad15a4e1ce8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b4668e64137494880935a57b77b1c4bbc96a7e1d8eac26fc590b05e8986e3730"
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
