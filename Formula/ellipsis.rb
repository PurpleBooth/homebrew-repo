class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.26.tar.gz"
  sha256 "b7351a0e3b125d7b45714570bd460fa21a61168ddd86e088cc801e367b091a47"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.26"
    sha256 cellar: :any_skip_relocation, big_sur:      "9f8a2b7fea0840c8978055d3bfb4f53da2a1fbeee7d7bba780fe75132210cc6c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "43d945138a28f2ada7dfed14f35d07e76cb2b926b291af8eb10fee7d27384257"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ellipsis", "-h"
    system "#{bin}/ellipsis", "-V"
  end
end
