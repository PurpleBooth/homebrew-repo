class PbGitHooks < Formula
  desc "My personal git commit hooks"
  homepage "https://github.com/PurpleBooth/pb-git-hooks"
  url "https://github.com/PurpleBooth/pb-git-hooks/archive/v2.8.0.tar.gz"
  version "2.8.0"
  sha256 "4d35030fb215e626fe5e151c416366b3dc60adf53f01ce69675ff1cd65a2dba0"

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
