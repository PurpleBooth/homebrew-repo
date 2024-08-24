class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.12.1.tar.gz"
  sha256 "c2c13e0b1c4e14944423b572d29cd21288a51b2b2f32396c72683cd61e2e5c2e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.12.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "fa1893ed8477990fbe6a06b83fafecbbeee851fd28eea2b0cf3f884ef4778abe"
    sha256 cellar: :any_skip_relocation, ventura:      "f794d9ae39d48227ad8c6561b91cd7071ce5ff8e38a234495750fe96510b0c8f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7f82d46e33f29b9f56ca235f87d6f2268d32bc47d8c0448aeb6a72f805d8ba3c"
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
