class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.99"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.99/phosphobot-0.3.99-arm64.bin"
      sha256 "cdeb561ecafd98fd46637b972c56985f0ed155ee718fe690ab54ac9cde2a193b"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.99/phosphobot-0.3.99-x86_64.bin"
      sha256 "1d06301b1e8f42cd0b36e87f2f521416fd95ac40d454ab64d73a7271caafcb76"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.99-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
