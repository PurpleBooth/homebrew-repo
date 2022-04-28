class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.42.tar.gz"
  sha256 "f1e2be35946adccf11622e914791d2d14e4e6f38f5574be9296186acea102f3d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.42"
    sha256 cellar: :any_skip_relocation, big_sur:      "798b66a972334521199c1118b368b8219c1a3526514a8a50597484c3e3aaed95"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a7d161773c18ef7e6dbea8687aa0a900d201cd1a880a75e1a66e16138b06d40a"
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
