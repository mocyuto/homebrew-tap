# frozen_string_literal: true

class Ec2Search < Formula
  desc "Search ec2 instance easily"
  homepage "https://github.com/mocyuto/ec2-search"
  url "https://github.com/mocyuto/ec2-search/archive/v0.2.0.tar.gz"
  version "0.2.0"
  sha256 "62342ced0f559320f8633cb86e84f5163ee78df151a48aab7c2a66ed2dee92d2"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
