class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.53"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.53/phosphobot-0.3.53-arm64.bin"
      sha256 "d56a85c2ca18182402bd46b2709c1dd6d1bbbf5f7005af344506e3495db315a3"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.53/phosphobot-0.3.53-x86_64.bin"
      sha256 "337f0a75ceb33080f185b45665a6dfc92a8f2f3198f1acb170d88af72a78ca33"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.53-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
