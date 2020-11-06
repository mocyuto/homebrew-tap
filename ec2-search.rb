# frozen_string_literal: true

class Ec2Search < Formula
  desc "Search ec2 instance easily"
  homepage "https://github.com/mocyuto/ec2-search"
  version "v0.3.2"
  license "Apache-2.0"

  bottle :unneeded

  if OS.mac?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-macos.tar.gz"
    sha256 "b9fac593a9c078d4d60f44f0dd6508452d2b5775226906e257434b74b9c8d265"
  elsif OS.linux?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-linux.tar.gz"
    sha256 "ae2d3c2c6f56781f3c81b333e0e2574ed3d3cccd75c4580281127c0c6dfc07b6"
  end

  def install
    bin.install "ec2s"
  end

  test do
    system "#{bin}/ec2s", "--version"
  end
end
