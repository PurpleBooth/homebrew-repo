class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://codeberg.org/PurpleBooth/whatismyip"
  url "https://codeberg.org/PurpleBooth/whatismyip/archive/v0.15.17.tar.gz"
  sha256 "02a2f7688c4830ccd2e1c484ffb054dfd386c78b22676ad36ab49b42a061a959"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.15.17"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "790c68c0601401a02e3773df1ab4acc5abd64ae9f1a0e7cff0f58312f375f232"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5e01e76ea6b280270ad8f5af25f1d0a5fb4a9b3884f4fbb22e74480169cb2187"
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
