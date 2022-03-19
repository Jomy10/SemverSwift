#![allow(unused)]

use semver::*;

pub struct PrereleaseResult {
    pub prerelease: Option<Prerelease>,
    pub error: Option<Error>
}

impl PrereleaseResult {
    pub fn from_pre_result(result: Result<Prerelease, Error>) -> Self {
        if result.is_ok() {
            PrereleaseResult {
                prerelease: Some(unsafe {result.unwrap_unchecked()}),
                error: None
            }
        } else {
            PrereleaseResult {
                prerelease: None,
                error: Some(unsafe { result.unwrap_err_unchecked() })
            }
        }
    }
    
    pub fn get_pre(&self) -> &Option<Prerelease> {
        &self.prerelease
    }
    
    pub fn get_err(&self) -> &Option<Error> {
        &self.error
    }
}

pub fn empty_prerelease() -> Prerelease {
    Prerelease::EMPTY
}

pub fn new_prerelease(text: &str) -> PrereleaseResult {
    PrereleaseResult::from_pre_result(Prerelease::new(text))
}