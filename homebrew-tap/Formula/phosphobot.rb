class Phosphobot < Formula
    desc "Phosphobot teleop application for robot control"
    homepage "https://github.com/phospho-app/phosphobot"
    url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.45/phosphobot.bin"
    sha256 "57fbde7418a3c89ba409a735f79ed8e616774bfeda2e5320fcd67d66b91d68ad"
    license "MIT"
  
    def install
      bin.install "phosphobot.bin" => "phosphobot"
    end
  
    test do
      system "#{bin}/phosphobot", "--version"
    end
  end