class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.182"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.182/phosphobot-0.2.182-arm64.bin"
      sha256 "766a32c25180843bfa5f9d666c377ac86c72ec75a00584067af49c02f7ac490d"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.182/phosphobot-0.2.182-x86_64.bin"
      sha256 "fc821a0a2d03217fc0c776597b3e6c9a803554fd36e943f7f93e78ff6a684dc3"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.182-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
