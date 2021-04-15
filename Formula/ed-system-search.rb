class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "3c860e88d6bc298f85d7499632629eae20e3703a6df53e713a5f2cfaca4dae58"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.2"
    sha256 cellar: :any_skip_relocation, catalina:     "b3902e2be575a0c9214dff455a589fd39798a21092df19d1c872a3c0adf00e68"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c1ecf1ff8a8c61b9a97533b903f194fce725e91d79ab9ff98f6601906f899d6f"
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
