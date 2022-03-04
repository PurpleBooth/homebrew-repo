class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.18.tar.gz"
  sha256 "b37ef19d0538c1736e4d51aa39950e2ff00987baa950b904e920df3d382b8e61"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.18"
    sha256 cellar: :any_skip_relocation, big_sur:      "8e213bcccbce720b2caf5a615ec0ce56dccbe0fb61f4963cb2225851dcb91c62"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8c928cec3ed1c0042df2209ea440fa658f41421c60c1ae9b5fcb24e605534a57"
  end

  depends_on "rust" => :build
  depends_on "socat" => :test
  depends_on "specdown/repo/specdown" => :test

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fast-conventional", "-h"
    system "#{bin}/fast-conventional", "-V"
    system "specdown run --temporary-workspace-dir --add-path \"#{bin}\" \"#{prefix}\/README.md\""
  end
end
