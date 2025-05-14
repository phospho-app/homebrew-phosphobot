class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.211"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.211/phosphobot-0.2.211-arm64.bin"
      sha256 "9fe5bee65f9e33eabd5a51c3afc6b7f62fe12fcec49eaddec43e94d7f6a28fd5"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.211/phosphobot-0.2.211-x86_64.bin"
      sha256 "4507f9cbda0e512971833e35bb4ad6f9dd513ee4621f26b0cf03cc8bc2eef7a1"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.211-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
