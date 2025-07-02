class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.51"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.51/phosphobot-0.3.51-arm64.bin"
      sha256 "a7a4b6a13f2dafc02c916417c2bfc88df656f708b174dddd8507b8c207f5b24b"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.51/phosphobot-0.3.51-x86_64.bin"
      sha256 "0a58af1b42c500e6a1b94036de88f89646160509e7c1c95a1061bc63c4c2e95f"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.51-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
