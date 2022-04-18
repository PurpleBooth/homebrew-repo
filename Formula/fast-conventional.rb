class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v2.2.4.tar.gz"
  sha256 "3240b378d960c0b259626defea85a355002476b76d7e377d7073d2c9cd5d195c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-2.2.4"
    sha256 cellar: :any_skip_relocation, big_sur:      "cc3f6af50e3cd03d15f821054c9d85b748710c4ea01fc2446c3c15916a9e0542"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "478d0c0ff3e0afca8e2344349be0f393d19cac122c3e8f714c2cd6b632120956"
  end

  depends_on "help2man" => :build
  depends_on "rust" => :build
  depends_on "socat" => :test
  depends_on "specdown/repo/specdown" => :test

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/fast-conventional", "completion", "bash")
    (bash_completion/"fast-conventional").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/fast-conventional", "completion", "zsh")
    (zsh_completion/"_fast-conventional").write output

    # Install fish completion
    output = Utils.safe_popen_read("#{bin}/fast-conventional", "completion", "fish")
    (fish_completion/"fast-conventional.fish").write output

    # Man pages
    output = Utils.safe_popen_read("help2man", "#{bin}/fast-conventional")
    (man1/"fast-conventional.1").write output
  end

  def caveats
    <<~EOS
      Update your git config to finish installation:
        $ git config --global alias.fci '-c "core.editor=fast-conventional editor" commit'
      To use it run
        $ git fci
      You may add any of the usual commit arguments
    EOS
  end

  test do
    system "#{bin}/fast-conventional", "-h"
    system "#{bin}/fast-conventional", "-V"
    system "specdown run --temporary-workspace-dir --add-path \"#{bin}\" \"#{prefix}\/README.md\""
  end
end
