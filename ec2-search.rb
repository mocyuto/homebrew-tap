class Ec2Search < Formula
  desc "search ec2 instance easily"
  homepage ""
  url "https://github.com/mocyuto/ec2-search/releases/download/v0.1.0/ec2-search-x86_64-apple-darwin.tar.gz"
  sha256 "6f369f92eb856fddb9322dbf44dd2aa675f2a733328c7f5c3e3fa04da5b7c6fd"
  license "Apache-2.0"
  version "0.1.0"

  def install
    bin.install "ec2-search"
  end

  test do
    system "true"
  end
end
