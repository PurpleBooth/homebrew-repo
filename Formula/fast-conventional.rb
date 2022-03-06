class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v2.1.0.tar.gz"
  sha256 "8d90b7698a8f59563c6fecaea00a919ba0f7776962d091d82ac40283bcedaf4d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-2.1.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "93677661177dc831109bc660ff653b42d546225876c6e4312a43f86f8b0bd07d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "da134e96969891f686f391ec14e034801dc7ba937ae485cad6ed7291a05880aa"
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
