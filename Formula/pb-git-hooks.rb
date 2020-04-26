class PbGitHooks < Formula
  desc "My personal git commit hooks"
  homepage "https://github.com/PurpleBooth/pb-git-hooks"
  url "https://github.com/PurpleBooth/pb-git-hooks/archive/v2.5.0.tar.gz"
  version "2.5.0"
  sha256 "7c2ec6d441131f9faeaebc9a55100ab88b9039f56412d08cf57eb681b7887c79"

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
