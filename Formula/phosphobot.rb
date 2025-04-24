class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.167"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.167/phosphobot-0.2.167-arm64.bin"
      sha256 "11894f281abd0862d4c4601893d15fa36fb5b0c9f903d5914f58d70349af32e3"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.167/phosphobot-0.2.167-x86_64.bin"
      sha256 "f2e1186055c188faef1c13ef2bb87d419677b7cbcccd7d5810b63e6023e7bff5"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.167-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
