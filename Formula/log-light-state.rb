class LogLightState < Formula
  desc "Log the current state of hue lights every 60 seconds"
  homepage "https://github.com/PurpleBooth/log-light-state"
  url "https://github.com/PurpleBooth/log-light-state/archive/refs/tags/v1.0.35.tar.gz"
  sha256 "26707fc902e9be5ffffe6a6e2752a3cbe5d2f7517bd65e93b018b7f5194c7422"
  license "CC0-1.0"
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
