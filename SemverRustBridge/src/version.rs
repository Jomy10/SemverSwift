use std::cmp::Ordering;
use semver::*;

/// bridging struct between Rust `Version` and Swift `Version`
pub struct _Version {
    pub version: Version
}

impl _Version {
    pub fn new_version(major: u64, minor: u64, patch: u64, pre: Option<Prerelease>, build: Option<BuildMetadata>) -> _Version {
        _Version {
            version: Version {
                major, minor, patch,
                pre: if let Some(pre) = pre { pre } else { Prerelease::EMPTY },
                build: if let Some(build) = build { build } else { BuildMetadata::EMPTY }
            }
        }
    }
    pub fn get_major(&self) -> u64 { self.version.major }
    pub fn get_minor(&self) -> u64 { self.version.minor }
    pub fn get_patch(&self) -> u64 { self.version.patch }
    pub fn get_pre(&self) -> Prerelease { self.version.pre.clone() }
    pub fn get_build(&self) -> BuildMetadata { self.version.build.clone() }
    pub fn set_major(&mut self, new_val: u64) { self.version.major = new_val }
    pub fn set_minor(&mut self, new_val: u64) { self.version.minor = new_val }
    pub fn set_patch(&mut self, new_val: u64) { self.version.patch = new_val }
    pub fn set_pre(&mut self, new_val: Prerelease) { self.version.pre = new_val }
    pub fn set_build(&mut self, new_val: BuildMetadata) { self.version.build = new_val }
}

impl ToString for _Version {
    fn to_string(&self) -> String {
        self.version.to_string()
    }
}

pub struct _VersionResult {
    version: _Version,
    error: Option<String>
}

impl _VersionResult {
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
    pub fn get_version(&mut self) -> &mut _Version {
        &mut self.version
    }
}

impl _Version {
    // TODO: change return type when SwiftBridge updates
    pub fn parse(text: &str) -> _VersionResult {
        let version_result = Version::parse(text);
        match version_result {
            Ok(version) => {
                return _VersionResult {
                    version: _Version{version},
                    error: None
                };
            }
            Err(error) => {
                _VersionResult {
                    // TODO: to option
                    version: _Version::new_version(0,0,0, None, None),
                    error: Some(error.to_string())
                }
            }
        }
    }
}

impl PartialEq<Self> for _Version {
    fn eq(&self, other: &Self) -> bool {
        self.version == other.version
    }
}

impl Eq for _Version {}

impl PartialOrd<Self> for _Version {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        self.version.partial_cmp(&other.version)
    }
}

impl Ord for _Version {
    fn cmp(&self, other: &Self) -> Ordering {
        self.version.cmp(&other.version)
    }
}

impl _Version {
    pub fn less_than(&self, other: &Self) -> bool {
        self < other
    }
}