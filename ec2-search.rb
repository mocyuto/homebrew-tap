# frozen_string_literal: true

class Ec2Search < Formula
  desc 'Search AWS EC2 easily'
  homepage 'https://github.com/mocyuto/ec2-search'
  version 'v0.9.1'
  license 'Apache-2.0'

  bottle :unneeded

  if OS.mac?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-macos.tar.gz"
    sha256 'dfc25992de4b0fff3a35660ae7a049f5db3fdf1f490ac08d5cd78b0f377fb396'
  elsif OS.linux?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-linux.tar.gz"
    sha256 'f1a5ecc02196fae599b0caeee8efd5bd22cdcaef127622dcfaec27229ea29537'
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
