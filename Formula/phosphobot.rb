class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.97/phosphobot-arm64.bin"
      sha256 "44d676760f027fa692c39f4bab1bea3e06ab1402d207319e3bbe4b368475a74e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.97/phosphobot-x86_64.bin"
      sha256 "e8ee8c3251095b119172411d114c88692b04d4ca4fde382ba62361c10bf970ff"
    end
  end
  
  def install
    bin_name = Hardware::CPU.arm? ? "phosphobot-arm64.bin" : "phosphobot-x86_64.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
