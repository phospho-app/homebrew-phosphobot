class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.121"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.121/phosphobot-0.2.121-arm64.bin"
      sha256 "db79543321732cb8f3663a2c750fb212bdb9df3e1590d9c6b580b9f5a1766991"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.121/phosphobot-0.2.121-x86_64.bin"
      sha256 "ffbb3b8f4735b0f89fb553bff7207d88ade5eed9cae754bec3def9e3b0d93779"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.121-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
