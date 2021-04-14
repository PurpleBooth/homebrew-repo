class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.12.6.tar.gz"
  sha256 "0b7017fdd7aa2c8a4654a099d87f45ecab21656318dafcc53ca461ddd0f0fd68"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.12.6"
    sha256 cellar: :any_skip_relocation, catalina:     "954abf8ea1ac37773627bde94d0301464504d340a5928f2d84137e9c95f14671"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6dbb38c837acaa968d3bf9df7beb268904655db8d9ddb25eee37c71752d87a26"
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
