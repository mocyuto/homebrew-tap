# frozen_string_literal: true

class Ec2Search < Formula
  desc "Search ec2 instance easily"
  homepage "https://github.com/mocyuto/ec2-search"
  version "v0.4.0"
  license "Apache-2.0"

  bottle :unneeded

  if OS.mac?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-macos.tar.gz"
    sha256 "11b68425fb117c541f946436cad5457f1a66251ad640ddc1ce7387190e260623"
  elsif OS.linux?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-linux.tar.gz"
    sha256 "4c8d98b3a7c766ae1007e345e9f2dc12fc9648a587a0f864387f778d351fe378"
  end

  def install
    bin.install "ec2s"
  end

  test do
    system "#{bin}/ec2s", "--version"
  end
end
