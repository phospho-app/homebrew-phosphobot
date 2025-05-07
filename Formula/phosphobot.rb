class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.206"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.206/phosphobot-0.2.206-arm64.bin"
      sha256 "9ed40f4773d6f3b1321e039a393322c293a81ddc1f1f1f7613732915e1d21b14"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.206/phosphobot-0.2.206-x86_64.bin"
      sha256 "ddca18e3e14157fe1784bd7ffc9b9bb5108a09b8881283ee4db536ad0796807b"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.206-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
