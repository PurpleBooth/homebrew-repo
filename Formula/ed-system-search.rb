class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.5.tar.gz"
  sha256 "c1ad33af8970b4e33ab5971a53561daf56ce8d09ff1ec35151acd3df3fb31d34"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.5"
    sha256 cellar: :any_skip_relocation, catalina:     "edd754c501d27cbde60e54c280e077201747c6ba9ef86b536775a5d7603278cd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "750978b7e375ad84155790c0215e9ebc2eab9b732dde55b071411aa8d04b1ed4"
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
