class ReadableNameGenerator < Formula
  desc "Generate a readable name using Dockers formula"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.100.1.tar.gz"
  sha256 "0ca6e27b1f1abb821da9d89856fcfcd572d5d365a5448d1c5ce1fd449d69a081"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.100.1"
    sha256 cellar: :any_skip_relocation, catalina:     "015cc7b33433e567a4a5815eb496e86b26932c0cd04baa3bab33d2b35096bb3a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b6fad9162c8c5b9808d316b95ce0319c459e5ab891335a7f73c72dceb03c43e3"
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
