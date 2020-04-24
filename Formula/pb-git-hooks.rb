class PbGitHooks < Formula
  desc "My personal git commit hooks"
  homepage "https://github.com/PurpleBooth/pb-git-hooks"
  url "https://github.com/PurpleBooth/pb-git-hooks/archive/v2.1.0.tar.gz"
  version "2.1.0"
  sha256 "9f7979ffb1a06b9983e4f8621ffc5551f7ed075e9361e8fb471e81ae323d3af5"

  depends_on "rust" => :build

  def install
        ENV['VERSION'] = version
        system "cargo", "install", "--locked", "--root", prefix, "--path", "./pb-commit-msg/"
        system "cargo", "install", "--locked", "--root", prefix, "--path", "./pb-pre-commit/"
        system "cargo", "install", "--locked", "--root", prefix, "--path", "./pb-prepare-commit-msg/"
  end

  test do
    system "#{bin}/art-station-i-guess", "-h"
    system "#{bin}/art-station-i-guess", "-V"
  end
end
