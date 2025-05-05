class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.190"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.190/phosphobot-0.2.190-arm64.bin"
      sha256 "31bcff65d724912f0ed4d3a85ed035486ca757d347fe4a16dfe06c0e70cc90a2"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.190/phosphobot-0.2.190-x86_64.bin"
      sha256 "30f7906d4e88b76c158f5c14e0930539733827aa3a134dd9358d9f6e597291fc"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.190-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
