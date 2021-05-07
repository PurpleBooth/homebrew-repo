class ReadableNameGenerator < Formula
  desc "Generate a readable name using Dockers formula"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.100.5.tar.gz"
  sha256 "9b20d2e51bc7060a6ecec775e3fac0da3774648f1b5c1b40b390574cbe5adddd"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system "#{bin}/readable-name-generator"
    refute_equal "", shell_output("#{bin}/readable-name-generator").strip
  end
end
