class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.15.tar.gz"
  sha256 "b97202dc8bd1ba12ae1ad304d3fd0184dfc224e9c4f7588bbd160ba29b89b7c7"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.15"
    sha256 cellar: :any_skip_relocation, big_sur:      "25f6b3dd573792660c88df8543c5bde6d3b2c07443361ab4109bfa0701da6ea4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8e6b65d005e1d599783e4c754f00125821724603265e72d56bbdef06f09325e3"
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
