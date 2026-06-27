# frozen_string_literal: true

class Zgt < Formula
  desc 'Git Worktree helper CLI'
  homepage 'https://github.com/mocyuto/zgt'
  version 'v0.15.0'
  license 'MIT'

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_darwin_arm64.tar.gz"
      sha256 '5abe463ce30848b78f0184071ca88f4b880e752e8695053b0a5f6435fe3ce319'
    else
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_darwin_amd64.tar.gz"
      sha256 'b3374a2edd2eec5b4fefc17cbd64c0405ff9d3467410aadb6d0a594afc9debbc'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_linux_arm64.tar.gz"
      sha256 '0834f46fe48e4c89d15c5f516d75a3e8d1e177df586149d20d4947c46264f7a6'
    else
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_linux_amd64.tar.gz"
      sha256 '9d889731cbdb8a65bc782e8926c610b4049979542b3913ede8f3daa2c64aa75e'
    end
  end

  def install
    bin.install 'zgt'

    # Install bash and zsh completion
    output = Utils.safe_popen_read("#{bin}/zgt", 'completion', 'bash')
    (bash_completion / 'zgt').write output
    output = Utils.safe_popen_read("#{bin}/zgt", 'completion', 'zsh')
    (zsh_completion / '_zgt').write output
  end

  test do
    system "#{bin}/zgt", '--version'
  end
end
