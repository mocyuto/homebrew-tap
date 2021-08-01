# frozen_string_literal: true

class Ec2Search < Formula
  desc 'Search AWS EC2 easily. named ec2s'
  homepage 'https://github.com/mocyuto/ec2-search'
  version 'v0.13.0'
  license 'Apache-2.0'

  bottle :unneeded

  if OS.mac?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-macos.tar.gz"
    sha256 'bcf31b8025901b5abb195afbaedae735557eba50a5e73690c959f2231e8296bb'
  elsif OS.linux?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-linux.tar.gz"
    sha256 '74eb36d97b3ee73aea06326d99061b44d5ee4601b144cdb0e816af88f72c78db'
  end

  def install
    bin.install 'ec2s'

    # Install bash and zsh completion
    output = Utils.safe_popen_read("#{bin}/ec2s", 'completion', 'bash')
    (bash_completion / 'ec2s').write output
    output = Utils.safe_popen_read("#{bin}/ec2s", 'completion', 'zsh')
    (zsh_completion / '_ec2s').write output
  end

  test do
    system "#{bin}/ec2s", '--version'
  end
end
