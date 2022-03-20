use semver::{Error, Prerelease, BuildMetadata, VersionReq, Op, Version};

// TODO: Comparator
// TODO: Error better implementation
pub use ffi::Operator;
#[swift_bridge::bridge]
mod ffi {
    extern "Rust" {
        type Error;
        
        #[swiff_bridge(associated_to = Error)]
        fn to_string(&self) -> String;
    }
    extern "Rust" {
        type _VersionResult;
        
        #[swift_bridge(associated_to = _VersionResult)]
        fn is_err(self: &_VersionResult) -> bool;
        fn is_ok(self: &_VersionResult) -> bool;
        fn get_version(self: &mut _VersionResult) -> &mut _Version;
        fn get_error_unsafe(self: &_VersionResult) -> &str;
        
        type _Version;
        
        #[swift_brige(init)]
        fn new_version(major: u64, minor: u64, patch: u64, pre: Option<Prerelease>, build: Option<BuildMetadata>) -> _Version;
        fn get_major(self: &_Version) -> u64;
        fn get_minor(self: &_Version) -> u64;
        fn get_patch(self: &_Version) -> u64;
        fn get_pre(self: &_Version) -> Prerelease;
        fn get_build(self: &_Version) -> BuildMetadata;
        fn set_major(self: &mut _Version, new_val: u64);
        fn set_minor(self: &mut _Version, new_val: u64);
        fn set_patch(self: &mut _Version, new_val: u64);
        fn set_pre(self: &mut _Version, new_val: Prerelease);
        fn set_build(self: &mut _Version, new_val: BuildMetadata);
        fn eq(self: &_Version, other: &_Version) -> bool;
        fn less_than(self: &_Version, other: &_Version) -> bool;
        fn to_string(self: &_Version) -> String;
    }
    extern "Rust" {
        #[swift_bridge(associated_to = _Version)]
        fn parse(text: &str) -> _VersionResult;
    }
    extern "Rust" {
        type Prerelease;
        
        #[swift_bridge(associated_to = Prerelease)]
        #[swift_bridge(swift_name = "__as_str")]
        fn as_str(self: &Prerelease) -> &str;
        #[swift_bridge(swift_name = "isEmpty")] // Does not work currently, so have a bridging function in Swift for now
        fn is_empty(self: &Prerelease) -> bool;
        fn len(self: &Prerelease) -> usize;
        #[swift_bridge(swift_name = "isCharBoundary")]
        fn is_char_boundary(self: &Prerelease, index: usize) -> bool;
        fn eq(self: &Prerelease, other: &Prerelease) -> bool;
        fn lt(self: &Prerelease, other: &Prerelease) -> bool;
    
        type _PrereleaseResult;
    
        fn new_prerelease(text: &str) -> _PrereleaseResult;
    
        #[swift_bridge(associated_to = _PrereleaseResult)]
        fn is_err(self: &_PrereleaseResult) -> bool;
        fn is_ok(self: &_PrereleaseResult) -> bool;
        fn unwrap_unchecked(self: &_PrereleaseResult) -> &Prerelease;
        fn unwrap_unchecked_owned(self: &_PrereleaseResult) -> Prerelease;
        fn unwrap_err_unchecked_to_string(self: &_PrereleaseResult) -> String;
    }
    
    extern "Rust" {
        fn empty_prerelease() -> Prerelease;
        // fn new_prerelease() -> PrereleaseResult;
    }
    
    extern "Rust" {
        type BuildMetadata;
        // TODO
    }
    
    #[swift_bridge(repr_swift = "enum")]
    pub enum Operator {
        Exact,
        Greater,
        GreaterEq,
        Less,
        LessEq,
        Tilde,
        Caret,
        Wildcard
    }
    
    extern "Rust" {
        type _VersionReqResult;
        type VersionReq;
    
        fn version_req_matches(version_req: &VersionReq, version: &_Version) -> bool;
        fn version_req_star() -> VersionReq;
        fn parse_version_req(text: &str) -> _VersionReqResult;
        fn version_req_eq(lhs: &VersionReq, rhs: &VersionReq) -> bool;
        fn version_req_to_string(req: &VersionReq) -> String;
        
        fn version_req_mut_to_owned(refer: &mut VersionReq) -> VersionReq;
    
        #[swift_bridge(associated_to = _VersionReqResult)]
        fn get_version(self: &mut _VersionReqResult) -> &mut VersionReq;
        fn get_error_unsafe(self: &_VersionReqResult) -> &str;
        fn is_err(self: &_VersionReqResult) -> bool;
    }

    extern "Rust" {
        type Comparator;

        #[swift_bridge(associated_to = Comparator)]
        #[swift_bridge(rust_name = "get_op")]
        pub fn getOperator(&self) -> Operator;
        #[swift_bridge(rust_name = "set_op")]
        pub fn setOperator(&mut self, op: Operator);
        #[swift_bridge(rust_name = "get_major")]
        pub fn getMajor(&self) -> u64;
        #[swift_bridge(rust_name = "set_major")]
        pub fn setMajor(&mut self, new_val: u64);
        #[swift_bridge(rust_name = "get_minor")]
        pub fn getMinor(&self) -> Option<u64>;
        #[swift_bridge(rust_name = "set_minor")]
        pub fn setMinor(&mut self, new_val: Option<u64>);
        #[swift_bridge(rust_name = "get_patch")]
        pub fn getPatch(&self) -> Option<u64>;
        #[swift_bridge(rust_name = "set_patch")]
        pub fn setPatch(&mut self, new_val: Option<u64>);
        #[swift_bridge(rust_name = "get_pre")]
        pub fn getPre(&self) -> Prerelease;
        #[swift_bridge(rust_name = "set_pre")]
        pub fn setPre(&mut self, new_val: Prerelease);
        #[swift_bridge(rust_name = "to_string")]
        pub fn toRustString(&self) -> String;
    }

    extern "Rust" {
        type _ComparatorResult;

        #[swift_bridge(associated_to = _ComparatorResult)]
        fn is_ok(&self) -> bool;
        fn unwrap_unsafe(&self) -> Comparator;
        fn unwrap_err_unsafe(&self) -> String;
    }

    extern "Rust" {
        fn comparator_matches(comp: &Comparator, version: &_Version) -> bool;
        fn parse_comparator(text: &str) -> _ComparatorResult;
    }
}

impl Operator {
    fn from_op(op: Op) -> Operator {
        match op {
            Op::Exact => Operator::Exact,
            Op::Greater => Operator::Greater,
            Op::GreaterEq => Operator::GreaterEq,
            Op::Less => Operator::Less,
            Op::LessEq => Operator::LessEq,
            Op::Tilde => Operator::Tilde,
            Op::Caret => Operator::Caret,
            Op::Wildcard => Operator::Wildcard,
            _ => unreachable!()
        }
    }
    fn to_op(&self) -> Op {
        match self {
            Operator::Exact => Op::Exact,
            Operator::Greater => Op::Greater,
            Operator::GreaterEq => Op::GreaterEq,
            Operator::Less => Op::Less,
            Operator::LessEq => Op::LessEq,
            Operator::Tilde => Op::Tilde,
            Operator::Caret => Op::Caret,
            Operator::Wildcard => Op::Wildcard,
        }
    }
}

mod version;
use version::*;

mod prerelease;
use prerelease::*;

mod version_req;
use version_req::*;

mod comparator;
use comparator::*;