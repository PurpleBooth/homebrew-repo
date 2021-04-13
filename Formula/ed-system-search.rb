class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.11.4.tar.gz"
  sha256 "785b7e8887e8696273173e4739739b2520f3c1d8cc3cef82695660319132fbd1"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.11.4"
    sha256 cellar: :any_skip_relocation, catalina:     "282afb6f8e14ef0609296971aba42d3f1c69b213de9b3dfcfe84625e54a7be58"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "136d7c2abb0de920caa62f628b3119d4908fcae3be3ff4e3a84611c242f39816"
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
