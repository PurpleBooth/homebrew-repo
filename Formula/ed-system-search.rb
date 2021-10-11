class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.0.22.tar.gz"
  sha256 "f078fba86cae87f0bd284925634ef7929d83e5a7cd791998e09fe5a16ab269bc"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.22"
    sha256 cellar: :any_skip_relocation, catalina:     "89c62831aac05770cfbb9af6d327db115458c3ac92bbea60a26d5abc0ce6ce84"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "db0429652f16323b57622e5e43fa4ddff74adda11a9d1dd4c6cd39b38c233e05"
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
