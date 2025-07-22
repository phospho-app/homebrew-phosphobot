class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.70"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.70/phosphobot-0.3.70-arm64.bin"
      sha256 "5106e6bfec91cf317521c56a845b317d63b34dfc280199a7f29d57520bf77c39"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.70/phosphobot-0.3.70-x86_64.bin"
      sha256 "4e16605f79e442679b62940eb79fcfb750a08d42a398fa07ce00ea75bb234029"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.70-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
