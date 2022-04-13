class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.37.tar.gz"
  sha256 "d97eaacec7472ef55a66ff3a8b101c25d022ca03489acfa6948e791b4ddd841f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.37"
    sha256 cellar: :any_skip_relocation, big_sur:      "538f836699b0df9f74e84409fb58437ee00f899c8ce661b5576319ff9d84c511"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b200fd900849c8b6074c2cf2680584347264d001942540776a04746f65f6b056"
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
