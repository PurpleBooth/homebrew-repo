class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.0.11.tar.gz"
  sha256 "44f57a1a63cbd6ac6cd300aeb51575d7ce5daaf8026beceafdcf7dfd74cfef45"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.11"
    sha256 cellar: :any_skip_relocation, catalina:     "01d41ad1e0f339c4189445c6f1b58e0ab2d114a573d6e6f06fea0dc8909cb84c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "116e110710132ff57697e1582752eee4a6a43a5c2ff75cde79ed6e84b0951057"
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
