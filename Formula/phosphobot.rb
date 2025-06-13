class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.45"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.45/phosphobot-0.3.45-arm64.bin"
      sha256 "856e29dcceaa4af6a69d4333955403d034099dd657b217e483370b55ba360bb1"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.45/phosphobot-0.3.45-x86_64.bin"
      sha256 "4793b300b7899d4aa31210336c80b15b4259b1b3eea28156dab328f3e30f969a"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.45-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
