# frozen_string_literal: true

class Ec2Search < Formula
  desc 'Search AWS EC2 easily. named ec2s'
  homepage 'https://github.com/mocyuto/ec2-search'
  version 'v0.11.0'
  license 'Apache-2.0'

  bottle :unneeded

  if OS.mac?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-macos.tar.gz"
    sha256 '6930408338ae61dc125246b3f9e507ef516778aaa1aec2671e5b021bbebc362d'
  elsif OS.linux?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-linux.tar.gz"
    sha256 '54d6b0d2a560a2e42a49d1311972be00bddb2a380b5ecdd41e58acbd35bda1bf'
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
