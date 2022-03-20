use semver::{Op, Prerelease, Version};
use crate::{Operator, _Version};

#[derive(PartialEq, Eq, Hash)]
pub struct Comparator {
    comp: semver::Comparator
}

impl Comparator {
    pub fn get_op(&self) -> Operator { Operator::from_op(self.comp.op) }
    pub fn set_op(&mut self, op: Operator) { self.comp.op = op.to_op() }

    pub fn get_major(&self) -> u64 { self.comp.major }
    pub fn set_major(&mut self, new_val: u64) { self.comp.major = new_val }

    pub fn get_minor(&self) -> Option<u64> { self.comp.minor }
    pub fn set_minor(&mut self, new_val: Option<u64>) { self.comp.minor = new_val }

    pub fn get_patch(&self) -> Option<u64> { self.comp.patch }
    pub fn set_patch(&mut self, new_val: Option<u64>) { self.comp.patch = new_val }

    pub fn get_pre(&self) -> Prerelease { self.comp.pre.clone() }
    pub fn set_pre(&mut self, new_val: Prerelease) { self.comp.pre = new_val }
}

pub struct _ComparatorResult {
    result: Result<semver::Comparator, semver::Error>
}

impl _ComparatorResult {
    pub fn is_ok(&self) -> bool { self.result.is_ok() }
    pub fn unwrap_unsafe(&self) -> Comparator { Comparator { comp: unsafe { self.result.as_ref().unwrap_unchecked().clone() } } }
    pub fn unwrap_err_unsafe(&self) -> String { unsafe { self.result.as_ref().unwrap_err_unchecked().to_string().to_owned() } }
}

pub fn parse_comparator(text: &str) -> _ComparatorResult {
    _ComparatorResult { result: semver::Comparator::parse(text) }
}

pub fn comparator_matches(comp: &Comparator, version: &_Version) -> bool {
    comp.comp.matches(&version.version)
}

impl ToString for Comparator {
    fn to_string(&self) -> String {
        self.comp.to_string()
    }
}
