class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.43.tar.gz"
  sha256 "be04d107f8e59bef5fb10ab905e399171c45cca1a7ad45068985021564d5b7a3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.43"
    sha256 cellar: :any_skip_relocation, big_sur:      "0f09a665bd2f4556ab9f0fc3a696bcdb26241f4dfef8d14badb5ad758e8432b3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ff7b3d9d44b9f785e04811a9cbd8e625e351ce7413ec8e5a3b76049d79488d14"
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
