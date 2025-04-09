class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.120"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.120/phosphobot-0.2.120-arm64.bin"
      sha256 "e6002e1f561a3f7b8bd4741c60b4b6004bcf16a116214fa3523dd8b281f99b60"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.120/phosphobot-0.2.120-x86_64.bin"
      sha256 "d35e9fdd860e420ddf03becab2184d7fba82ae21543562a035d1bc6f3c5ed9bc"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.120-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
