class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.123"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.123/phosphobot-0.3.123-arm64.bin"
      sha256 "f9f452702acfcf31115d58f02e62c2c8aa26df7f8c96973ab6ad20ba602770d9"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.123/phosphobot-0.3.123-x86_64.bin"
      sha256 "5173081d80ed75fe9b4eabe67f1e0806cc38e0add02a6a05865347ee87c4df68"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.123-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
