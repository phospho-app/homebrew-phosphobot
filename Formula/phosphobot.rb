class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.97"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.97/phosphobot-0.3.97-arm64.bin"
      sha256 "2f732d1970aecbac78b8ad19d669011e93e86990825b4ae98fe2863b3e8655f3"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.97/phosphobot-0.3.97-x86_64.bin"
      sha256 "76d8e51d9c2d82136dbb0df5e209bec57c9feed83b05fe7b8acb1c4d10618855"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.97-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
