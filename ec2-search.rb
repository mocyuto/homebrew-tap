# frozen_string_literal: true

class Ec2Search < Formula
  desc "Search AWS EC2 easily"
  homepage "https://github.com/mocyuto/ec2-search"
  version "v0.5.0"
  license "Apache-2.0"

  bottle :unneeded

  if OS.mac?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-macos.tar.gz"
    sha256 "4ddd25639fe99392ca784cb904b8b280d25e97124206b7e0eba669d2cdaea111"
  elsif OS.linux?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-linux.tar.gz"
    sha256 "0d524ed606048de09b29271522157badfec5c2a3969efc75f2f797f0abe95485"
  end

  def install
    bin.install "ec2s"
  end

  test do
    system "#{bin}/ec2s", "--version"
  end
end
