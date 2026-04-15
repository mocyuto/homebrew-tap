# frozen_string_literal: true

class ZgtAT0140 < Formula
  desc 'Git Worktree helper CLI'
  homepage 'https://github.com/mocyuto/zgt'
  version 'v0.14.0'
  license 'MIT'

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_darwin_arm64.tar.gz"
      sha256 'f10235367a72a047219e51740b29654be8d114057a76dc06f4ad32b7f77e8096'
    else
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_darwin_amd64.tar.gz"
      sha256 'b8d13ff66a89261b37cbb44168de4628f2c5d999e90a598766e985ba09f36440'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_linux_arm64.tar.gz"
      sha256 'afa8a0449be0597d3ccaa0ff8a65ff65bdfe265cd2a202124a02ff98bff78421'
    else
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_linux_amd64.tar.gz"
      sha256 '7e2cc17c4cd437fafac15df3faa009c1674353aec5245dcf8d33e9cbbdb29ef2'
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
