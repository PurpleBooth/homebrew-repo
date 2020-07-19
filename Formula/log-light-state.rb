class LogLightState < Formula
  desc "Log the current state of hue lights every 60 seconds"
  homepage "https://github.com/PurpleBooth/log-light-state"
  url "https://github.com/PurpleBooth/log-light-state/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d4c27f42c3274b56574ee81c9652dbf08dee71d2e07f5db4e774e3421e40af42"
  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "d5d1b59d9e8d0f886f7295b476dd87a20d298c6a9c797b3c3a082cbcf65097e1" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./"
  end

  test do
    system "#{bin}/log-light-state", "--help"
  end
end
