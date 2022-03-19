use semver::*;
use crate::_Version;
use crate::bridge_result::BridgeResult;

pub struct _VersionReqResult {
    version: Option<VersionReq>,
    error: Option<String>
}

impl _VersionReqResult {
    pub fn is_err(&self) -> bool {
        self.error.is_some()
    }
    
    pub fn is_ok(&self) -> bool {
        self.error.is_none()
    }
    
    /// `is_err` or `is_ok` should be used before calling this function
    unsafe fn get_error(&self) -> &str {
        self.error.as_ref().unwrap_unchecked().as_str()
    }
    
    pub fn get_error_unsafe(&self) -> &str {
        unsafe { self.get_error() }
    }
    
    /// `is_err` or `is_ok` should be used before calling this function
    pub fn get_version(&mut self) -> &mut VersionReq {
        unsafe { self.version.as_mut().unwrap_unchecked() }
    }
}

impl _VersionReqResult {
    fn from_result(result: Result<VersionReq, Error>) -> Self {
        match result {
            Ok(version) => {
                _VersionReqResult { version: Some(version), error: None }
            }
            Err(error) => {
                _VersionReqResult { version: None, error: Some(error.to_string()) }
            }
        }
    }
}

pub fn parse_version_req(text: &str) -> _VersionReqResult {
    _VersionReqResult::from_result(VersionReq::parse(text))
}

pub fn version_req_matches(version_req: &VersionReq, version: &_Version) -> bool {
    version_req.matches(&version.version)
}

/// A VersionReq with not constraint on the version numbers it matches.
pub fn version_req_star() -> VersionReq {
    VersionReq::STAR
}

pub fn version_req_eq(lhs: &VersionReq, rhs: &VersionReq) -> bool {
    lhs == rhs
}

pub fn version_req_to_string(req: &VersionReq) -> String {
    req.to_string()
}

pub fn version_req_mut_to_owned(refer: &mut VersionReq) -> VersionReq {
    VersionReq { comparators: refer.comparators.clone() }
}
