class PbGitHooks < Formula
  desc "My personal git commit hooks"
  homepage "https://github.com/PurpleBooth/pb-git-hooks"
  url "https://github.com/PurpleBooth/pb-git-hooks/archive/v0.6.0.tar.gz"
  version "0.6.0"
  sha256 "ae774ad63b28506012b781a4513c8af65d6e0e86d58e8ee27d243690cd7920d5"

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
