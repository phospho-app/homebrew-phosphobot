class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.78"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.78/phosphobot-0.3.78-arm64.bin"
      sha256 "8477c9f1c57083b64d9009edf90fbcf6fbc411f4561da2d492b1a20aca2fa35e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.78/phosphobot-0.3.78-x86_64.bin"
      sha256 "0af0bffb5a08d0f1b6a0eadd4e451c9a8ab9f3596510b2e4482bb5c3809a9306"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.78-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
