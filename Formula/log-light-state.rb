class LogLightState < Formula
  desc "Log the current state of hue lights every 60 seconds"
  homepage "https://github.com/PurpleBooth/log-light-state"
  url "https://github.com/PurpleBooth/log-light-state/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "6e5974a9ba805f851101e5e0e36e96a606212fb025a6ff5fa6328b48831abec9"
  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "926ba6a9641de65e202d75ffd5c34f01845e8e93d0072c2725b6debbdfd69aab" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./"
  end

  test do
    system "#{bin}/log-light-state", "--help"
  end
end
