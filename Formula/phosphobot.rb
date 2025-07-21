class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.68"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.68/phosphobot-0.3.68-arm64.bin"
      sha256 "a8c21909b918abd0e57dbfcb446d786a451e0176d761f14fdbe42dd6487df4b9"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.68/phosphobot-0.3.68-x86_64.bin"
      sha256 "32604c40b99fa29c0df39164fd2868c52c694b72ed02d017ce390c8d814d9dfe"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.68-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
