class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.38.tar.gz"
  sha256 "8f54194a1bab68f6479873b55833ef959443aa3e12ce8389ca947f2bbd4ef9b9"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.38"
    sha256 cellar: :any_skip_relocation, big_sur:      "737ba8f63e50ce578e76cd9f72d621adb0573b73dbdc69afe0ccad34c3fa9ab8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "02582968666fbd8ebc7cbae8be5a83586a123cf2a1dfbf0682732479dbd7894f"
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
