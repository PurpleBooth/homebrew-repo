class PbGitHooks < Formula
  desc "My personal git commit hooks"
  homepage "https://github.com/PurpleBooth/pb-git-hooks"
  url "https://github.com/PurpleBooth/pb-git-hooks/archive/v1.1.0.tar.gz"
  version "1.1.0"
  sha256 "cd3af41d5b3e7ea6288229cee42509d16848ee46daf1d87ca00f7df22593b409"

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
