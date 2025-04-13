class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.134"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.134/phosphobot-0.2.134-arm64.bin"
      sha256 "3a8ed43d6c46a60eb65d3344999a6d8f5b46e21d9ff0012ec4d779d6df0a468c"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.134/phosphobot-0.2.134-x86_64.bin"
      sha256 "d8934824443b5d9d6a4d4120582be6e83f8ef5678f4a93e40542ccb0223c4826"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.134-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
