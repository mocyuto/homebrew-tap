# frozen_string_literal: true

class ZgtAT0101 < Formula
  desc 'Git Worktree helper CLI'
  homepage 'https://github.com/mocyuto/zgt'
  version 'v0.10.1'
  license 'MIT'

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_darwin_arm64.tar.gz"
      sha256 'e729f1d09182b6b4a1b3a8bbe018160f0006058f7802ebca33082a5476b6a656'
    else
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_darwin_amd64.tar.gz"
      sha256 '9f398cea9bec4ec559db1ad1dc11960c23fc57bd8c5afdc05bccf33644fce55c'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_linux_arm64.tar.gz"
      sha256 '2a1f711e65fa8e1ba71fd86e644618c48c3bebd10e569367f096cb518c2ced1b'
    else
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_linux_amd64.tar.gz"
      sha256 '467566dd4e6ea95c09ffd6fd75c3a1e4d199e566ed4da80ae78a29e3fd06cc3c'
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
