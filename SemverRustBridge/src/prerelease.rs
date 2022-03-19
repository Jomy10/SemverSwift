#![allow(unused)]

use semver::*;

pub struct _PrereleaseResult {
    pub prerelease: Option<Prerelease>,
    pub error: Option<Error>
}

impl _PrereleaseResult {
    pub fn from_pre_result(result: Result<Prerelease, Error>) -> Self {
        if result.is_ok() {
            _PrereleaseResult {
                prerelease: Some(unsafe {result.unwrap_unchecked()}),
                error: None
            }
        } else {
            _PrereleaseResult {
                prerelease: None,
                error: Some(unsafe { result.unwrap_err_unchecked() })
            }
        }
    }
    
    fn get_pre(&self) -> &Option<Prerelease> { &self.prerelease }
    
    fn get_err(&self) -> &Option<Error> { &self.error }
    
    pub fn is_err(&self) -> bool { self.error.is_some() }
    
    pub fn is_ok(&self) -> bool { self.prerelease.is_some() }
    
    pub fn unwrap_unchecked(&self) -> &Prerelease {
        unsafe { &self.prerelease.as_ref().unwrap_unchecked() }
    }
    
    pub fn unwrap_unchecked_owned(&self) -> Prerelease {
        unsafe { self.prerelease.clone().unwrap_unchecked() }
    }
    
    fn unwrap_err_unchecked(&self) -> &Error {
        unsafe { &self.error.as_ref().unwrap_unchecked() }
    }
    
    pub fn unwrap_err_unchecked_to_string(&self) -> String {
        self.unwrap_err_unchecked().to_string()
    }
}

pub fn empty_prerelease() -> Prerelease {
    Prerelease::EMPTY
}

pub fn new_prerelease(text: &str) -> _PrereleaseResult {
    _PrereleaseResult::from_pre_result(Prerelease::new(text))
}