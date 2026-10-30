# IMGLYONNXRuntime

[ONNX Runtime](https://github.com/microsoft/onnxruntime) for the IMG.LY Swift plugins that run an on-device model, such as
[IMGLYPluginBackgroundRemoval](https://github.com/imgly/IMGLYPluginBackgroundRemoval-swift). A plugin that needs ONNX
Runtime depends on this package, so an app with several such plugins links one copy of ONNX Runtime. Swift Package
Manager adds the package for you; you do not depend on it yourself.

The product `IMGLYONNXRuntime` holds Microsoft's Objective-C bindings as the module `OnnxRuntimeBindings`, and ONNX
Runtime as a dynamic xcframework. Microsoft's Swift package ships ONNX Runtime as a static library inside a framework,
which fails App Store validation (ITMS-90208) in an app built with Xcode 26, so this package links it into a dynamic one.

An app that also depends on Microsoft's
[onnxruntime-swift-package-manager](https://github.com/microsoft/onnxruntime-swift-package-manager) fails to resolve,
because both packages declare the targets `onnxruntime` and `OnnxRuntimeBindings`. Such an app can use the
`OnnxRuntimeBindings` module of this package instead, which has the same API.

## Versions

The package has its own semantic version, not the CE.SDK version. A new ONNX Runtime version raises the minor or the
major version, and a packaging fix raises the patch version. A plugin accepts every patch release of the minor
version it names, so a packaging fix reaches an app without a plugin update, and a new ONNX Runtime version does not.

| Package | ONNX Runtime |
| ------- | ------------ |
| 1.0.0   | 1.24.2       |

## License

MIT License, © Microsoft Corporation (`LICENSE.md`). `Sources/OnnxRuntimeBindings` is a copy of the Objective-C bindings
from [microsoft/onnxruntime-swift-package-manager](https://github.com/microsoft/onnxruntime-swift-package-manager), and
the `onnxruntime` binary is Microsoft's ONNX Runtime C library (`pod-archive-onnxruntime-c`), linked as a dynamic
framework.
