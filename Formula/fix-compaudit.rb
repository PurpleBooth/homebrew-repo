class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/refs/tags/v0.46.56.tar.gz"
  sha256 "8fe376d9cb74cbc3b096133669d4b6f780fa04ffd11e3906687a52b303232112"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.56"
    sha256 cellar: :any_skip_relocation, catalina:     "c50b0cce57b9751c72530d576016c6447c4ae17920ad61071acd92ff5bae8c71"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9e2bf0704cc80251640de9f6db9db9e3d976b4cb7ec4756734d07db53c4f3fa9"
  end

  depends_on "rust" => :build
  depends_on "zsh"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fix-compaudit", "-h"
    system "#{bin}/fix-compaudit", "-V"
  end
end
