// swift-tools-version:6.3.1
import PackageDescription

let package = Package(
  name: "IMGLYONNXRuntime",
  platforms: [.iOS(.v16)],
  products: [
    .library(
      name: "IMGLYONNXRuntime",
      targets: ["OnnxRuntimeBindings"],
    ),
  ],
  targets: [
    .binaryTarget(
      name: "onnxruntime",
      url: "https://cdn.img.ly/packages/imgly/onnxruntime/1.24.2/onnxruntime.xcframework.zip",
      checksum: "03f4cb6719fa308b4e521cbcf6ba4ae1bc7d52bda4f46d1cf707b0ef2a0aac9e",
    ),
    .target(
      name: "OnnxRuntimeBindings",
      dependencies: ["onnxruntime"],
      cxxSettings: [.define("SPM_BUILD")],
    ),
  ],
  cxxLanguageStandard: .cxx17,
)
