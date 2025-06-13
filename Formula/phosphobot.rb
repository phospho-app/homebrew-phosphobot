class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.46"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.46/phosphobot-0.3.46-arm64.bin"
      sha256 "4858b5c9c5d86d8184c4f03bedd629ea5fb599939de86ea981d21e517e618390"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.46/phosphobot-0.3.46-x86_64.bin"
      sha256 "987b8a9d6c24b728557816008f70e994a074fcd1b9b88cc7e4086ff8ef0cf107"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.46-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
