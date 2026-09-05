# swift-rfc-4007-coder

Wire coders for the RFC 4007 IPv6 scoped-address domain model in [swift-rfc-4007](https://github.com/swift-ietf/swift-rfc-4007): `RFC_4007.IPv6.ScopedAddress.Coder` parses and serializes the `address%zone` text form over any byte cursor, and the package adds the ASCII and Binary `Parseable`/`Serializable`, `Coder.Codable`, `CustomStringConvertible`, `LosslessStringConvertible` and `RawRepresentable` conformances that the pure domain package deliberately leaves out. Apache 2.0, see [LICENSE.md](LICENSE.md).
