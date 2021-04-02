class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/refs/tags/v1.53.33.tar.gz"
  sha256 "04e454b5ea6e02ead39f1196a4b4ba4b3f1c3cb6895c14ea77782710afefe767"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.33"
    sha256 cellar: :any_skip_relocation, catalina:     "15a59e84bef9694913f2dad1880e6f0637cfebbf5a6232a6b5b0385dccd3dda6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b04d52b24eea1fa72d06d685267b93fbf8954a1d460d362fe13b383efeda7999"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/game-of-life", "-h"
    system "#{bin}/game-of-life", "-V"
    system "#{bin}/game-of-life", "-s", "1"
  end
end
