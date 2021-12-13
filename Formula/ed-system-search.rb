class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.11.tar.gz"
  sha256 "3084aab970efc2bf61082bd29a237d771bc6ef3f89b226fb3ea7a8db1e3bb63d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.11"
    sha256 cellar: :any_skip_relocation, catalina:     "01927a6f7c6e0183cc5a06549cb600c3bf30992e2a0e55962b0fff6cebeb44cd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "45791d46d63d4722dfaa46172084d663cd94d9dda396d31b5637339cc68cce39"
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
