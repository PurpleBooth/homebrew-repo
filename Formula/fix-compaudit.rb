class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/refs/tags/v0.46.57.tar.gz"
  sha256 "69c5bfdeaa6e9979fecf3b3867b6294385314a172761111a9ebae2519b00f674"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.57"
    sha256 cellar: :any_skip_relocation, catalina:     "723095a6a32d226f1ba487fc1f70302995bfa0e9f3974341cec7780cb7dd6366"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "43ca1536e8975a65330bb8e073cbbf5403bcc0c0ac94e4dd89a3042372f66e2c"
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
