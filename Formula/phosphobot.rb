class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.67"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.67/phosphobot-0.3.67-arm64.bin"
      sha256 "8d504d07a6c0575250b60a658a6daf0fffeaa5801284b5103fd56ad15fda91aa"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.67/phosphobot-0.3.67-x86_64.bin"
      sha256 "5674b1f399ab9cb356728c1be62fb387581d67e0c391fa5396d096a2e8ba84d3"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.67-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
