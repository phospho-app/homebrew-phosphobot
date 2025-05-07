class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.204"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.204/phosphobot-0.2.204-arm64.bin"
      sha256 "3762423ee662e7557483ebc204d8ec159e83df7e989a2564bf30412a14089d1e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.204/phosphobot-0.2.204-x86_64.bin"
      sha256 "ba4c89542ae2c7f8ac9ed794432798f5ec3d2f62ac5f2592c2f7277e67609d35"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.204-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
