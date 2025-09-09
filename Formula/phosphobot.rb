class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.116"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.116/phosphobot-0.3.116-arm64.bin"
      sha256 "7b68c4e1778dc551cb71719966a54efcecfd173494f1e12006890b26dc8c9b09"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.116/phosphobot-0.3.116-x86_64.bin"
      sha256 "b3553bb4d4483bb7d86beb44d714ee1fae595a3b773da27c6f83a18f19ca2bb4"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.116-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
