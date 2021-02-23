# frozen_string_literal: true

class Ec2Search < Formula
  desc 'Search AWS EC2 easily. named ec2s'
  homepage 'https://github.com/mocyuto/ec2-search'
  version 'v0.12.0'
  license 'Apache-2.0'

  bottle :unneeded

  if OS.mac?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-macos.tar.gz"
    sha256 '4f83b02c9e4734a97a37af8feeaefefdd3599e4cf105c5aa6d4cd9e7d1941ef6'
  elsif OS.linux?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-linux.tar.gz"
    sha256 'cdc2bc156fd0c42a8bb0b27185ed38bbbfe9d82ef5823993e3ad5d6239e058d1'
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
