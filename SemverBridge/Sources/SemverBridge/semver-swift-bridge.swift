import Framework
public func empty_prerelease() -> Prerelease {
    Prerelease(ptr: __swift_bridge__$empty_prerelease())
}
public func version_req_matches(_ version_req: VersionReqRef, _ version: _VersionRef) -> Bool {
    __swift_bridge__$version_req_matches(version_req.ptr, version.ptr)
}
public func version_req_star() -> VersionReq {
    VersionReq(ptr: __swift_bridge__$version_req_star())
}
public func parse_version_req<GenericToRustStr: ToRustStr>(_ text: GenericToRustStr) -> _VersionReqResult {
    return text.toRustStr({ textAsRustStr in
        _VersionReqResult(ptr: __swift_bridge__$parse_version_req(textAsRustStr))
    })
}
public func version_req_eq(_ lhs: VersionReqRef, _ rhs: VersionReqRef) -> Bool {
    __swift_bridge__$version_req_eq(lhs.ptr, rhs.ptr)
}
public func version_req_to_string(_ req: VersionReqRef) -> RustString {
    RustString(ptr: __swift_bridge__$version_req_to_string(req.ptr))
}
public func version_req_mut_to_owned(_ refer: VersionReqRefMut) -> VersionReq {
    VersionReq(ptr: __swift_bridge__$version_req_mut_to_owned(refer.ptr))
}

public class Error: ErrorRefMut {
    var isOwned: Bool = true

    public override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }

    deinit {
        if isOwned {
            __swift_bridge__$Error$_free(ptr)
        }
    }
}
public class ErrorRefMut: ErrorRef {
    public override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }
}
public class ErrorRef {
    var ptr: UnsafeMutableRawPointer

    public init(ptr: UnsafeMutableRawPointer) {
        self.ptr = ptr
    }
}
extension ErrorRef {
    public func to_string() -> RustString {
        RustString(ptr: __swift_bridge__$Error$to_string(ptr))
    }
}
extension Error: Vectorizable {
    public static func vecOfSelfNew() -> UnsafeMutableRawPointer {
        __swift_bridge__$Vec_Error$new()
    }

    public static func vecOfSelfFree(vecPtr: UnsafeMutableRawPointer) {
        __swift_bridge__$Vec_Error$drop(vecPtr)
    }

    public static func vecOfSelfPush(vecPtr: UnsafeMutableRawPointer, value: Error) {
        __swift_bridge__$Vec_Error$push(vecPtr, {value.isOwned = false; return value.ptr;}())
    }

    public static func vecOfSelfPop(vecPtr: UnsafeMutableRawPointer) -> Optional<Self> {
        let pointer = __swift_bridge__$Vec_Error$pop(vecPtr)
        if pointer == nil {
            return nil
        } else {
            return (Error(ptr: pointer!) as! Self)
        }
    }

    public static func vecOfSelfGet(vecPtr: UnsafeMutableRawPointer, index: UInt) -> Optional<ErrorRef> {
        let pointer = __swift_bridge__$Vec_Error$get(vecPtr, index)
        if pointer == nil {
            return nil
        } else {
            return ErrorRef(ptr: pointer!)
        }
    }

    public static func vecOfSelfGetMut(vecPtr: UnsafeMutableRawPointer, index: UInt) -> Optional<ErrorRefMut> {
        let pointer = __swift_bridge__$Vec_Error$get_mut(vecPtr, index)
        if pointer == nil {
            return nil
        } else {
            return ErrorRefMut(ptr: pointer!)
        }
    }

    public static func vecOfSelfLen(vecPtr: UnsafeMutableRawPointer) -> UInt {
        __swift_bridge__$Vec_Error$len(vecPtr)
    }
}


public class _Version: _VersionRefMut {
    var isOwned: Bool = true

    public override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }

    deinit {
        if isOwned {
            __swift_bridge__$_Version$_free(ptr)
        }
    }
}
extension _Version {
    public convenience init(_ major: UInt64, _ minor: UInt64, _ patch: UInt64) {
        self.init(ptr: __swift_bridge__$_Version$new_version(major, minor, patch))
    }
}
extension _Version {
    class public func parse<GenericToRustStr: ToRustStr>(_ text: GenericToRustStr) -> _VersionResult {
        return text.toRustStr({ textAsRustStr in
            _VersionResult(ptr: __swift_bridge__$_Version$parse(textAsRustStr))
        })
    }
}
public class _VersionRefMut: _VersionRef {
    public override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }
}
extension _VersionRefMut {
    public func set_major(_ new_val: UInt64) {
        __swift_bridge__$_Version$set_major(ptr, new_val)
    }

    public func set_minor(_ new_val: UInt64) {
        __swift_bridge__$_Version$set_minor(ptr, new_val)
    }

    public func set_patch(_ new_val: UInt64) {
        __swift_bridge__$_Version$set_patch(ptr, new_val)
    }
}
public class _VersionRef {
    var ptr: UnsafeMutableRawPointer

    public init(ptr: UnsafeMutableRawPointer) {
        self.ptr = ptr
    }
}
extension _VersionRef {
    public func get_major() -> UInt64 {
        __swift_bridge__$_Version$get_major(ptr)
    }

    public func get_minor() -> UInt64 {
        __swift_bridge__$_Version$get_minor(ptr)
    }

    public func get_patch() -> UInt64 {
        __swift_bridge__$_Version$get_patch(ptr)
    }

    public func eq(_ other: _VersionRef) -> Bool {
        __swift_bridge__$_Version$eq(ptr, other.ptr)
    }

    public func less_than(_ ohter: _VersionRef) -> Bool {
        __swift_bridge__$_Version$less_than(ptr, ohter.ptr)
    }
}
extension _Version: Vectorizable {
    public static func vecOfSelfNew() -> UnsafeMutableRawPointer {
        __swift_bridge__$Vec__Version$new()
    }

    public static func vecOfSelfFree(vecPtr: UnsafeMutableRawPointer) {
        __swift_bridge__$Vec__Version$drop(vecPtr)
    }

    public static func vecOfSelfPush(vecPtr: UnsafeMutableRawPointer, value: _Version) {
        __swift_bridge__$Vec__Version$push(vecPtr, {value.isOwned = false; return value.ptr;}())
    }

    public static func vecOfSelfPop(vecPtr: UnsafeMutableRawPointer) -> Optional<Self> {
        let pointer = __swift_bridge__$Vec__Version$pop(vecPtr)
        if pointer == nil {
            return nil
        } else {
            return (_Version(ptr: pointer!) as! Self)
        }
    }

    public static func vecOfSelfGet(vecPtr: UnsafeMutableRawPointer, index: UInt) -> Optional<_VersionRef> {
        let pointer = __swift_bridge__$Vec__Version$get(vecPtr, index)
        if pointer == nil {
            return nil
        } else {
            return _VersionRef(ptr: pointer!)
        }
    }

    public static func vecOfSelfGetMut(vecPtr: UnsafeMutableRawPointer, index: UInt) -> Optional<_VersionRefMut> {
        let pointer = __swift_bridge__$Vec__Version$get_mut(vecPtr, index)
        if pointer == nil {
            return nil
        } else {
            return _VersionRefMut(ptr: pointer!)
        }
    }

    public static func vecOfSelfLen(vecPtr: UnsafeMutableRawPointer) -> UInt {
        __swift_bridge__$Vec__Version$len(vecPtr)
    }
}


public class _VersionResult: _VersionResultRefMut {
    var isOwned: Bool = true

    public override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }

    deinit {
        if isOwned {
            __swift_bridge__$_VersionResult$_free(ptr)
        }
    }
}
public class _VersionResultRefMut: _VersionResultRef {
    public override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }
}
extension _VersionResultRefMut {
    public func get_version() -> _VersionRefMut {
        _VersionRefMut(ptr: __swift_bridge__$_VersionResult$get_version(ptr))
    }
}
public class _VersionResultRef {
    var ptr: UnsafeMutableRawPointer

    public init(ptr: UnsafeMutableRawPointer) {
        self.ptr = ptr
    }
}
extension _VersionResultRef {
    public func is_err() -> Bool {
        __swift_bridge__$_VersionResult$is_err(ptr)
    }

    public func is_ok() -> Bool {
        __swift_bridge__$_VersionResult$is_ok(ptr)
    }

    public func get_error_unsafe() -> RustStr {
        __swift_bridge__$_VersionResult$get_error_unsafe(ptr)
    }
}
extension _VersionResult: Vectorizable {
    public static func vecOfSelfNew() -> UnsafeMutableRawPointer {
        __swift_bridge__$Vec__VersionResult$new()
    }

    public static func vecOfSelfFree(vecPtr: UnsafeMutableRawPointer) {
        __swift_bridge__$Vec__VersionResult$drop(vecPtr)
    }

    public static func vecOfSelfPush(vecPtr: UnsafeMutableRawPointer, value: _VersionResult) {
        __swift_bridge__$Vec__VersionResult$push(vecPtr, {value.isOwned = false; return value.ptr;}())
    }

    public static func vecOfSelfPop(vecPtr: UnsafeMutableRawPointer) -> Optional<Self> {
        let pointer = __swift_bridge__$Vec__VersionResult$pop(vecPtr)
        if pointer == nil {
            return nil
        } else {
            return (_VersionResult(ptr: pointer!) as! Self)
        }
    }

    public static func vecOfSelfGet(vecPtr: UnsafeMutableRawPointer, index: UInt) -> Optional<_VersionResultRef> {
        let pointer = __swift_bridge__$Vec__VersionResult$get(vecPtr, index)
        if pointer == nil {
            return nil
        } else {
            return _VersionResultRef(ptr: pointer!)
        }
    }

    public static func vecOfSelfGetMut(vecPtr: UnsafeMutableRawPointer, index: UInt) -> Optional<_VersionResultRefMut> {
        let pointer = __swift_bridge__$Vec__VersionResult$get_mut(vecPtr, index)
        if pointer == nil {
            return nil
        } else {
            return _VersionResultRefMut(ptr: pointer!)
        }
    }

    public static func vecOfSelfLen(vecPtr: UnsafeMutableRawPointer) -> UInt {
        __swift_bridge__$Vec__VersionResult$len(vecPtr)
    }
}


public class Prerelease: PrereleaseRefMut {
    var isOwned: Bool = true

    public override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }

    deinit {
        if isOwned {
            __swift_bridge__$Prerelease$_free(ptr)
        }
    }
}
public class PrereleaseRefMut: PrereleaseRef {
    public override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }
}
public class PrereleaseRef {
    var ptr: UnsafeMutableRawPointer

    public init(ptr: UnsafeMutableRawPointer) {
        self.ptr = ptr
    }
}
extension PrereleaseRef {
    public func as_str() -> RustStr {
        __swift_bridge__$Prerelease$as_str(ptr)
    }

    public func is_empty() -> Bool {
        __swift_bridge__$Prerelease$is_empty(ptr)
    }

    public func len() -> UInt {
        __swift_bridge__$Prerelease$len(ptr)
    }

    public func is_char_boundary(_ index: UInt) -> Bool {
        __swift_bridge__$Prerelease$is_char_boundary(ptr, index)
    }
}
extension Prerelease: Vectorizable {
    public static func vecOfSelfNew() -> UnsafeMutableRawPointer {
        __swift_bridge__$Vec_Prerelease$new()
    }

    public static func vecOfSelfFree(vecPtr: UnsafeMutableRawPointer) {
        __swift_bridge__$Vec_Prerelease$drop(vecPtr)
    }

    public static func vecOfSelfPush(vecPtr: UnsafeMutableRawPointer, value: Prerelease) {
        __swift_bridge__$Vec_Prerelease$push(vecPtr, {value.isOwned = false; return value.ptr;}())
    }

    public static func vecOfSelfPop(vecPtr: UnsafeMutableRawPointer) -> Optional<Self> {
        let pointer = __swift_bridge__$Vec_Prerelease$pop(vecPtr)
        if pointer == nil {
            return nil
        } else {
            return (Prerelease(ptr: pointer!) as! Self)
        }
    }

    public static func vecOfSelfGet(vecPtr: UnsafeMutableRawPointer, index: UInt) -> Optional<PrereleaseRef> {
        let pointer = __swift_bridge__$Vec_Prerelease$get(vecPtr, index)
        if pointer == nil {
            return nil
        } else {
            return PrereleaseRef(ptr: pointer!)
        }
    }

    public static func vecOfSelfGetMut(vecPtr: UnsafeMutableRawPointer, index: UInt) -> Optional<PrereleaseRefMut> {
        let pointer = __swift_bridge__$Vec_Prerelease$get_mut(vecPtr, index)
        if pointer == nil {
            return nil
        } else {
            return PrereleaseRefMut(ptr: pointer!)
        }
    }

    public static func vecOfSelfLen(vecPtr: UnsafeMutableRawPointer) -> UInt {
        __swift_bridge__$Vec_Prerelease$len(vecPtr)
    }
}


public class BuildMetadata: BuildMetadataRefMut {
    var isOwned: Bool = true

    public override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }

    deinit {
        if isOwned {
            __swift_bridge__$BuildMetadata$_free(ptr)
        }
    }
}
public class BuildMetadataRefMut: BuildMetadataRef {
    public override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }
}
public class BuildMetadataRef {
    var ptr: UnsafeMutableRawPointer

    public init(ptr: UnsafeMutableRawPointer) {
        self.ptr = ptr
    }
}
extension BuildMetadata: Vectorizable {
    public static func vecOfSelfNew() -> UnsafeMutableRawPointer {
        __swift_bridge__$Vec_BuildMetadata$new()
    }

    public static func vecOfSelfFree(vecPtr: UnsafeMutableRawPointer) {
        __swift_bridge__$Vec_BuildMetadata$drop(vecPtr)
    }

    public static func vecOfSelfPush(vecPtr: UnsafeMutableRawPointer, value: BuildMetadata) {
        __swift_bridge__$Vec_BuildMetadata$push(vecPtr, {value.isOwned = false; return value.ptr;}())
    }

    public static func vecOfSelfPop(vecPtr: UnsafeMutableRawPointer) -> Optional<Self> {
        let pointer = __swift_bridge__$Vec_BuildMetadata$pop(vecPtr)
        if pointer == nil {
            return nil
        } else {
            return (BuildMetadata(ptr: pointer!) as! Self)
        }
    }

    public static func vecOfSelfGet(vecPtr: UnsafeMutableRawPointer, index: UInt) -> Optional<BuildMetadataRef> {
        let pointer = __swift_bridge__$Vec_BuildMetadata$get(vecPtr, index)
        if pointer == nil {
            return nil
        } else {
            return BuildMetadataRef(ptr: pointer!)
        }
    }

    public static func vecOfSelfGetMut(vecPtr: UnsafeMutableRawPointer, index: UInt) -> Optional<BuildMetadataRefMut> {
        let pointer = __swift_bridge__$Vec_BuildMetadata$get_mut(vecPtr, index)
        if pointer == nil {
            return nil
        } else {
            return BuildMetadataRefMut(ptr: pointer!)
        }
    }

    public static func vecOfSelfLen(vecPtr: UnsafeMutableRawPointer) -> UInt {
        __swift_bridge__$Vec_BuildMetadata$len(vecPtr)
    }
}


public class VersionReq: VersionReqRefMut {
    var isOwned: Bool = true

    public override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }

    deinit {
        if isOwned {
            __swift_bridge__$VersionReq$_free(ptr)
        }
    }
}
public class VersionReqRefMut: VersionReqRef {
    public override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }
}
public class VersionReqRef {
    var ptr: UnsafeMutableRawPointer

    public init(ptr: UnsafeMutableRawPointer) {
        self.ptr = ptr
    }
}
extension VersionReq: Vectorizable {
    public static func vecOfSelfNew() -> UnsafeMutableRawPointer {
        __swift_bridge__$Vec_VersionReq$new()
    }

    public static func vecOfSelfFree(vecPtr: UnsafeMutableRawPointer) {
        __swift_bridge__$Vec_VersionReq$drop(vecPtr)
    }

    public static func vecOfSelfPush(vecPtr: UnsafeMutableRawPointer, value: VersionReq) {
        __swift_bridge__$Vec_VersionReq$push(vecPtr, {value.isOwned = false; return value.ptr;}())
    }

    public static func vecOfSelfPop(vecPtr: UnsafeMutableRawPointer) -> Optional<Self> {
        let pointer = __swift_bridge__$Vec_VersionReq$pop(vecPtr)
        if pointer == nil {
            return nil
        } else {
            return (VersionReq(ptr: pointer!) as! Self)
        }
    }

    public static func vecOfSelfGet(vecPtr: UnsafeMutableRawPointer, index: UInt) -> Optional<VersionReqRef> {
        let pointer = __swift_bridge__$Vec_VersionReq$get(vecPtr, index)
        if pointer == nil {
            return nil
        } else {
            return VersionReqRef(ptr: pointer!)
        }
    }

    public static func vecOfSelfGetMut(vecPtr: UnsafeMutableRawPointer, index: UInt) -> Optional<VersionReqRefMut> {
        let pointer = __swift_bridge__$Vec_VersionReq$get_mut(vecPtr, index)
        if pointer == nil {
            return nil
        } else {
            return VersionReqRefMut(ptr: pointer!)
        }
    }

    public static func vecOfSelfLen(vecPtr: UnsafeMutableRawPointer) -> UInt {
        __swift_bridge__$Vec_VersionReq$len(vecPtr)
    }
}


public class _VersionReqResult: _VersionReqResultRefMut {
    var isOwned: Bool = true

    public override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }

    deinit {
        if isOwned {
            __swift_bridge__$_VersionReqResult$_free(ptr)
        }
    }
}
public class _VersionReqResultRefMut: _VersionReqResultRef {
    public override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }
}
extension _VersionReqResultRefMut {
    public func get_version() -> VersionReqRefMut {
        VersionReqRefMut(ptr: __swift_bridge__$_VersionReqResult$get_version(ptr))
    }
}
public class _VersionReqResultRef {
    var ptr: UnsafeMutableRawPointer

    public init(ptr: UnsafeMutableRawPointer) {
        self.ptr = ptr
    }
}
extension _VersionReqResultRef {
    public func get_error_unsafe() -> RustStr {
        __swift_bridge__$_VersionReqResult$get_error_unsafe(ptr)
    }

    public func is_err() -> Bool {
        __swift_bridge__$_VersionReqResult$is_err(ptr)
    }
}
extension _VersionReqResult: Vectorizable {
    public static func vecOfSelfNew() -> UnsafeMutableRawPointer {
        __swift_bridge__$Vec__VersionReqResult$new()
    }

    public static func vecOfSelfFree(vecPtr: UnsafeMutableRawPointer) {
        __swift_bridge__$Vec__VersionReqResult$drop(vecPtr)
    }

    public static func vecOfSelfPush(vecPtr: UnsafeMutableRawPointer, value: _VersionReqResult) {
        __swift_bridge__$Vec__VersionReqResult$push(vecPtr, {value.isOwned = false; return value.ptr;}())
    }

    public static func vecOfSelfPop(vecPtr: UnsafeMutableRawPointer) -> Optional<Self> {
        let pointer = __swift_bridge__$Vec__VersionReqResult$pop(vecPtr)
        if pointer == nil {
            return nil
        } else {
            return (_VersionReqResult(ptr: pointer!) as! Self)
        }
    }

    public static func vecOfSelfGet(vecPtr: UnsafeMutableRawPointer, index: UInt) -> Optional<_VersionReqResultRef> {
        let pointer = __swift_bridge__$Vec__VersionReqResult$get(vecPtr, index)
        if pointer == nil {
            return nil
        } else {
            return _VersionReqResultRef(ptr: pointer!)
        }
    }

    public static func vecOfSelfGetMut(vecPtr: UnsafeMutableRawPointer, index: UInt) -> Optional<_VersionReqResultRefMut> {
        let pointer = __swift_bridge__$Vec__VersionReqResult$get_mut(vecPtr, index)
        if pointer == nil {
            return nil
        } else {
            return _VersionReqResultRefMut(ptr: pointer!)
        }
    }

    public static func vecOfSelfLen(vecPtr: UnsafeMutableRawPointer) -> UInt {
        __swift_bridge__$Vec__VersionReqResult$len(vecPtr)
    }
}



