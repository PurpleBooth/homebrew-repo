class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.17.tar.gz"
  sha256 "47d33f6b87175704b44a4a90afe10321a974611735fada7d9bf0f0b533438664"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.17"
    sha256 cellar: :any_skip_relocation, big_sur:      "f3f79c292781beaa1636d07d1a0172d58c9fbfc982cc14fd1693a4da26bdd04d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a67a5559e5b06a22d60050b0467efec0f54028e94d4f3783ab6d33d972b8f6ea"
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
