import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    configureWritableTempDirectory()

    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }

  private func configureWritableTempDirectory() {
    let fileManager = FileManager.default
    guard let cachesDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first else {
      return
    }

    let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? "flutter-app"
    let tempDirectory = cachesDirectory
      .appendingPathComponent(bundleName, isDirectory: true)
      .appendingPathComponent("tmp", isDirectory: true)

    do {
      try fileManager.createDirectory(at: tempDirectory, withIntermediateDirectories: true)
      let tempPath = tempDirectory.path
      setenv("TMPDIR", tempPath, 1)
      setenv("TMP", tempPath, 1)
      setenv("TEMP", tempPath, 1)
      setenv("TEMPDIR", tempPath, 1)
    } catch {
      NSLog("Failed to configure writable temp directory at %@: %@", tempDirectory.path, error.localizedDescription)
    }
  }
}
