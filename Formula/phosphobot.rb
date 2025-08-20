class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.92"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.92/phosphobot-0.3.92-arm64.bin"
      sha256 "e951a09db6f9ce28c82d0a7a37fc69905a967e7fb4e4447df69644f0901cf7a5"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.92/phosphobot-0.3.92-x86_64.bin"
      sha256 "20902bbf6f57119f372037f0c092f6fc1904cd4f84459dcbf22b524784703976"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.92-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
