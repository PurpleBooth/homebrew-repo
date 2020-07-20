class LogLightState < Formula
  desc "Log the current state of hue lights every 60 seconds"
  homepage "https://github.com/PurpleBooth/log-light-state"
  url "https://github.com/PurpleBooth/log-light-state/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "1dd2999408270ae58fb9ab02388a00a209d29cec6774f50586b3e824a195c08d"
  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "60f42486ec2acd440cd374d1e937904e210b138970f0c0016625c94741c386c3" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./"
  end

  test do
    system "#{bin}/log-light-state", "--help"
  end
end
