# frozen_string_literal: true

class GitWt < Formula
  desc 'Git Worktree helper CLI'
  homepage 'https://github.com/mocyuto/git-wt'
  version 'v0.2.1'
  license 'MIT'

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_darwin_arm64.tar.gz"
      sha256 '3ef5b74bad2ab3dc3ecd7e50e8593aeeabb5fb479ff4a1dc5f9b13569c0d269d'
    else
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_darwin_amd64.tar.gz"
      sha256 'a79ebb9ce4cd40c46caf72204d09ec48a9764d25c8d1f1bdc969690712df36ee'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_linux_arm64.tar.gz"
      sha256 'bd455cdb69eca4488a23280874a84f25661b5adc721f50eb7e858a095605abe4'
    else
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_linux_amd64.tar.gz"
      sha256 'f530b3209cc3d80247ed2a1faa052bc623e3c732933be50637b72a0284bb540e'
    end
  end

  def install
    bin.install 'git-wt'

    # Install bash and zsh completion
    output = Utils.safe_popen_read("#{bin}/git-wt", 'completion', 'bash')
    (bash_completion / 'git-wt').write output
    output = Utils.safe_popen_read("#{bin}/git-wt", 'completion', 'zsh')
    (zsh_completion / '_git-wt').write output
  end

  test do
    system "#{bin}/git-wt", '--version'
  end
end
