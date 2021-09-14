class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.0.20.tar.gz"
  sha256 "a7aeee677bffc0b5d9f8b3a45d4157cc428bb6bd98ccae0a24b50588ed6285e7"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.20"
    sha256 cellar: :any_skip_relocation, catalina:     "d449b969fb0dc3aa4f35b2fd180127a3b8dedf212c3155cbec677dbece99fafa"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fbe27059f3ae3d6cc2223517b87b7d266817eff77316ef66578cbd56893cdf6f"
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
