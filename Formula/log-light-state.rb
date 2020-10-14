class LogLightState < Formula
  desc "Log the current state of hue lights every 60 seconds"
  homepage "https://github.com/PurpleBooth/log-light-state"
  url "https://github.com/PurpleBooth/log-light-state/archive/refs/tags/v1.0.33.tar.gz"
  sha256 "78b04098ed050eaa946169cd9bf1a6ce1d9c90622d5bce6337ded8c4ac4e18fa"
  license "CC0-1.0"
  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "11b5dfd65e6f4490b5735a7b8f5c5914d95e6d7a29012fac1946893efe561d7b" => :catalina
    sha256 "2abbc396de890f4a9bb41d23a728babf683a5047ae13dc20b0345526021e5208" => :x86_64_linux
  end

  depends_on "rust" => :build
  on_linux do
    depends_on "openssl@1.1"
  end

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./"
  end

  test do
    system "#{bin}/log-light-state", "--help"
  end
end
