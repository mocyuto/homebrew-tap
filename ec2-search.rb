# frozen_string_literal: true

class Ec2Search < Formula
  desc "Search AWS EC2 easily"
  homepage "https://github.com/mocyuto/ec2-search"
  version "v0.7.0"
  license "Apache-2.0"

  bottle :unneeded

  if OS.mac?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-macos.tar.gz"
    sha256 "fa36af5e2f00483348d5323514be7f54093b916cec25e16a559c7dbebae20c10"
  elsif OS.linux?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-linux.tar.gz"
    sha256 "ecbe9a1addd6779a5809db30b85ae2e93839ae50f4ff2718196fc88c1486820b"
  end

  def install
    bin.install "ec2s"
  end

  test do
    system "#{bin}/ec2s", "--version"
  end
end
