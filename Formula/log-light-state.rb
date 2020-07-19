class LogLightState < Formula
  desc "Log the current state of hue lights every 60 seconds"
  homepage "https://github.com/PurpleBooth/log-light-state"
  url "https://github.com/PurpleBooth/log-light-state/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "b4305681b4cad5c7ca7b4cef2697c8a137a9579a6548306c4f5a7fe38ae94735"
  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "cb704502c83eb6cc6b9fd6ca185b9f8a80f2edbe52add99617975f27ec9a8ea0" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./"
  end

  test do
    system "#{bin}/log-light-state", "--help"
  end
end
