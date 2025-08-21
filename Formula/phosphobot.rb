class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.95"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.95/phosphobot-0.3.95-arm64.bin"
      sha256 "39fcc3d0b0e1f2f0fd78b29ab30a05396a25e0f7ee9c63d83b44eca5d4837f2f"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.95/phosphobot-0.3.95-x86_64.bin"
      sha256 "8ffb8ad26b3954f147727c0714ab03eddae831026d0546e9e81425157166ce79"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.95-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
