class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.133"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.133/phosphobot-0.2.133-arm64.bin"
      sha256 "3ef707b9b7546504f60c8c28475e594bc398872a48276bd0b1508476e32e39c8"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.133/phosphobot-0.2.133-x86_64.bin"
      sha256 "b38c92a1d40bef5354a33bc75a25ef994de3a39e45d9a252d30e4bddb1529218"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.133-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
