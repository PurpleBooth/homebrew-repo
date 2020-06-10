class ReadableNameGenerator < Formula
  desc "Generate a readable name using Dockers formula"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.40.0.tar.gz"
  sha256 "573fae2671bcb7f8d44deac032dcfd1e69f0a85093afb8feb92ea9ce837eba6a"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "a364989a63306c5192f5bac74cc3afaea3ca128b754ef7a34d09941e18ad8cd7" => :catalina
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system "#{bin}/readable-name-generator"
    assert_not_equal "", shell_output("#{bin}/readable-name-generator").strip
  end
end
