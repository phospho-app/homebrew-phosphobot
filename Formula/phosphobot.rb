class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.7"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.7/phosphobot-0.3.7-arm64.bin"
      sha256 "0fc28f22dc838608d4f84af80f52fa53361a7b121246fa89c8eb8b90de34bced"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.7/phosphobot-0.3.7-x86_64.bin"
      sha256 "50a53d350a41dbf0cfef30583642af21fd11b7e063c737d6519140615d0b9a53"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.7-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
