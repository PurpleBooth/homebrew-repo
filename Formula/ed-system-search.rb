class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "1699de4c314310744c679976e7002e05079a77b85d681b4115e115faad8bd95c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.4"
    sha256 cellar: :any_skip_relocation, catalina:     "d574c1928b123265de11f35cfcb0dc52626db396b941c3e8412e3641c625b69a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8dccaa1f6caf88f032726f6a19942da6a59297e7c40c733f36d70569aeb5411b"
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
