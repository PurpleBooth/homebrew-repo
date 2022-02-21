class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.37.tar.gz"
  sha256 "63760585cbe56d847fcd9a76c5d46dccd7fdac9de7208ad9bc237ba5315c6137"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.37"
    sha256 cellar: :any_skip_relocation, big_sur:      "6344625d907ff83eba8903550830df403ad07c5a8df8f156d0fd4e040ca06644"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3e5cc3f10077ada531ce997cb0ca8ae560150c3131d02eea32dc5d17a6488ca0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/whatismyip", "-h"
    system "#{bin}/whatismyip", "-V"
  end
end
