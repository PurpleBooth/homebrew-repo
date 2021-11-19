class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.21.tar.gz"
  sha256 "c88d59669cefad06a3aea07b4c8d0ffd1dca0d8bbb995aa1f38cb2aa2d697dd4"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.21"
    sha256 cellar: :any_skip_relocation, catalina:     "012a517d6066f6d241f9caf7722a927c37c09a75713b2e8957aa7ff632a20651"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "677ea8c6f1e1c44a650cd5a5a176b5af4ccd8399db7bb3d974b23ff6b853a091"
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
