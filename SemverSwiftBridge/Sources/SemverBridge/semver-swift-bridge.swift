import Framework
public func new_prerelease<GenericToRustStr: ToRustStr>(_ text: GenericToRustStr) -> _PrereleaseResult {
    return text.toRustStr({ textAsRustStr in
        _PrereleaseResult(ptr: __swift_bridge__$new_prerelease(textAsRustStr))
    })
}
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
    public convenience init(_ major: UInt64, _ minor: UInt64, _ patch: UInt64, _ pre: Optional<Prerelease>, _ build: Optional<BuildMetadata>) {
        self.init(ptr: __swift_bridge__$_Version$new_version(major, minor, patch, { if let val = pre { val.isOwned = false; return val.ptr } else { return nil } }(), { if let val = build { val.isOwned = false; return val.ptr } else { return nil } }()))
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

    public func set_pre(_ new_val: Prerelease) {
        __swift_bridge__$_Version$set_pre(ptr, {new_val.isOwned = false; return new_val.ptr;}())
    }

    public func set_build(_ new_val: BuildMetadata) {
        __swift_bridge__$_Version$set_build(ptr, {new_val.isOwned = false; return new_val.ptr;}())
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

    public func get_pre() -> Prerelease {
        Prerelease(ptr: __swift_bridge__$_Version$get_pre(ptr))
    }

    public func get_build() -> BuildMetadata {
        BuildMetadata(ptr: __swift_bridge__$_Version$get_build(ptr))
    }

    public func eq(_ other: _VersionRef) -> Bool {
        __swift_bridge__$_Version$eq(ptr, other.ptr)
    }

    public func less_than(_ other: _VersionRef) -> Bool {
        __swift_bridge__$_Version$less_than(ptr, other.ptr)
    }

    public func to_string() -> RustString {
        RustString(ptr: __swift_bridge__$_Version$to_string(ptr))
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


public class _PrereleaseResult: _PrereleaseResultRefMut {
    var isOwned: Bool = true

    public override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }

    deinit {
        if isOwned {
            __swift_bridge__$_PrereleaseResult$_free(ptr)
        }
    }
}
public class _PrereleaseResultRefMut: _PrereleaseResultRef {
    public override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }
}
public class _PrereleaseResultRef {
    var ptr: UnsafeMutableRawPointer

    public init(ptr: UnsafeMutableRawPointer) {
        self.ptr = ptr
    }
}
extension _PrereleaseResultRef {
    public func is_err() -> Bool {
        __swift_bridge__$_PrereleaseResult$is_err(ptr)
    }

    public func is_ok() -> Bool {
        __swift_bridge__$_PrereleaseResult$is_ok(ptr)
    }

    public func unwrap_unchecked() -> PrereleaseRef {
        PrereleaseRef(ptr: __swift_bridge__$_PrereleaseResult$unwrap_unchecked(ptr))
    }

    public func unwrap_unchecked_owned() -> Prerelease {
        Prerelease(ptr: __swift_bridge__$_PrereleaseResult$unwrap_unchecked_owned(ptr))
    }

    public func unwrap_err_unchecked_to_string() -> RustString {
        RustString(ptr: __swift_bridge__$_PrereleaseResult$unwrap_err_unchecked_to_string(ptr))
    }
}
extension _PrereleaseResult: Vectorizable {
    public static func vecOfSelfNew() -> UnsafeMutableRawPointer {
        __swift_bridge__$Vec__PrereleaseResult$new()
    }

    public static func vecOfSelfFree(vecPtr: UnsafeMutableRawPointer) {
        __swift_bridge__$Vec__PrereleaseResult$drop(vecPtr)
    }

    public static func vecOfSelfPush(vecPtr: UnsafeMutableRawPointer, value: _PrereleaseResult) {
        __swift_bridge__$Vec__PrereleaseResult$push(vecPtr, {value.isOwned = false; return value.ptr;}())
    }

    public static func vecOfSelfPop(vecPtr: UnsafeMutableRawPointer) -> Optional<Self> {
        let pointer = __swift_bridge__$Vec__PrereleaseResult$pop(vecPtr)
        if pointer == nil {
            return nil
        } else {
            return (_PrereleaseResult(ptr: pointer!) as! Self)
        }
    }

    public static func vecOfSelfGet(vecPtr: UnsafeMutableRawPointer, index: UInt) -> Optional<_PrereleaseResultRef> {
        let pointer = __swift_bridge__$Vec__PrereleaseResult$get(vecPtr, index)
        if pointer == nil {
            return nil
        } else {
            return _PrereleaseResultRef(ptr: pointer!)
        }
    }

    public static func vecOfSelfGetMut(vecPtr: UnsafeMutableRawPointer, index: UInt) -> Optional<_PrereleaseResultRefMut> {
        let pointer = __swift_bridge__$Vec__PrereleaseResult$get_mut(vecPtr, index)
        if pointer == nil {
            return nil
        } else {
            return _PrereleaseResultRefMut(ptr: pointer!)
        }
    }

    public static func vecOfSelfLen(vecPtr: UnsafeMutableRawPointer) -> UInt {
        __swift_bridge__$Vec__PrereleaseResult$len(vecPtr)
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

    public func eq(_ other: PrereleaseRef) -> Bool {
        __swift_bridge__$Prerelease$eq(ptr, other.ptr)
    }

    public func lt(_ other: PrereleaseRef) -> Bool {
        __swift_bridge__$Prerelease$lt(ptr, other.ptr)
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

public enum Operator {
    case Exact
    case Greater
    case GreaterEq
    case Less
    case LessEq
    case Tilde
    case Caret
    case Wildcard
}
extension Operator {
    func intoFfiRepr() -> __swift_bridge__$Operator {
        switch self {
            case Operator.Exact:
                return __swift_bridge__$Operator(tag: __swift_bridge__$Operator$Exact)
            case Operator.Greater:
                return __swift_bridge__$Operator(tag: __swift_bridge__$Operator$Greater)
            case Operator.GreaterEq:
                return __swift_bridge__$Operator(tag: __swift_bridge__$Operator$GreaterEq)
            case Operator.Less:
                return __swift_bridge__$Operator(tag: __swift_bridge__$Operator$Less)
            case Operator.LessEq:
                return __swift_bridge__$Operator(tag: __swift_bridge__$Operator$LessEq)
            case Operator.Tilde:
                return __swift_bridge__$Operator(tag: __swift_bridge__$Operator$Tilde)
            case Operator.Caret:
                return __swift_bridge__$Operator(tag: __swift_bridge__$Operator$Caret)
            case Operator.Wildcard:
                return __swift_bridge__$Operator(tag: __swift_bridge__$Operator$Wildcard)
        }
    }
}
extension __swift_bridge__$Operator {
    func intoSwiftRepr() -> Operator {
        switch self.tag {
            case __swift_bridge__$Operator$Exact:
                return Operator.Exact
            case __swift_bridge__$Operator$Greater:
                return Operator.Greater
            case __swift_bridge__$Operator$GreaterEq:
                return Operator.GreaterEq
            case __swift_bridge__$Operator$Less:
                return Operator.Less
            case __swift_bridge__$Operator$LessEq:
                return Operator.LessEq
            case __swift_bridge__$Operator$Tilde:
                return Operator.Tilde
            case __swift_bridge__$Operator$Caret:
                return Operator.Caret
            case __swift_bridge__$Operator$Wildcard:
                return Operator.Wildcard
            default:
                fatalError("Unreachable")
        }
    }
}
extension __swift_bridge__$Option$Operator {
    @inline(__always)
    func intoSwiftRepr() -> Optional<Operator> {
        if self.is_some {
            return self.val.intoSwiftRepr()
        } else {
            return nil
        }
    }

    @inline(__always)
    static func fromSwiftRepr(_ val: Optional<Operator>) -> __swift_bridge__$Option$Operator {
        if let v = val {
            return __swift_bridge__$Option$Operator(is_some: true, val: v.intoFfiRepr())
        } else {
            return __swift_bridge__$Option$Operator(is_some: false, val: __swift_bridge__$Operator())
        }
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



