class LogLightState < Formula
  desc "Log the current state of hue lights every 60 seconds"
  homepage "https://github.com/PurpleBooth/log-light-state"
  url "https://github.com/PurpleBooth/log-light-state/archive/refs/tags/v1.0.12.tar.gz"
  sha256 "b0f37468ca5042018ee68763069055fb1db77002ed837b69a2b839a6cdce3a95"
  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "086eb254e5fc593acd811b96e778a56d25f6305ab278b63da2a7488deba58cd2" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./"
  end

  test do
    system "#{bin}/log-light-state", "--help"
  end
end
