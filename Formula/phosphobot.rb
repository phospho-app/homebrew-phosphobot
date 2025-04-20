class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.154"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.154/phosphobot-0.2.154-arm64.bin"
      sha256 "9ffa8848fdde94551117dd34e2d59b694dbfe4280db411b92c1d7491af3691a3"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.154/phosphobot-0.2.154-x86_64.bin"
      sha256 "d979719f4f8724b346dd34e80e11a6ef96721e8d543aabad55beabee55fc1d26"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.154-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
