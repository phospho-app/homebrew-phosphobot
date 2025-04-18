class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.149"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.149/phosphobot-0.2.149-arm64.bin"
      sha256 "432be51f9bb076defb7d0fee0819da583e9f718c1719c64f45e4a844d4cf8987"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.149/phosphobot-0.2.149-x86_64.bin"
      sha256 "c00acd6a011572c5e74b12083733c75cbe827a7a9f68af4ad52f89e828402eef"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.149-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
