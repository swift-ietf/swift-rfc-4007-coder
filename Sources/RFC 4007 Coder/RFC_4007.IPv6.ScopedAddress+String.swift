import ASCII
import Byte
public import RFC_4007

extension RFC_4007.IPv6.ScopedAddress: @retroactive CustomStringConvertible {

    public var description: String {
        String(ascii: self)
    }
}

extension RFC_4007.IPv6.ScopedAddress: @retroactive LosslessStringConvertible {

    public init?(_ description: String) {
        do throws(Error) {
            try self.init(ascii: description.utf8.map(Byte.init(bitPattern:)))
        } catch {
            return nil
        }
    }
}

extension RFC_4007.IPv6.ScopedAddress: @retroactive Swift.RawRepresentable {

    public var rawValue: String { description }

    public init?(rawValue: String) {
        self.init(rawValue)
    }
}
