class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.84"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.84/phosphobot-0.3.84-arm64.bin"
      sha256 "8ac02a7ce1c414fc60c8d875c96caa4b66628f411adc07c20812ca8076ce0d1d"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.84/phosphobot-0.3.84-x86_64.bin"
      sha256 "37ade6523d50b2edcb4100ed33b61d8eb1e7b2fcc8644f2797e80b8fb4650e16"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.84-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
