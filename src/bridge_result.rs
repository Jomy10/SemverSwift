pub trait BridgeResult<V> {
    fn _get_error(&self) -> &Option<String>;
    fn is_err(&self) -> bool { self._get_error().is_some() }
    fn is_ok(&self) -> bool { self._get_error().is_none() }
    /// `is_err` or `is_ok` should be used before calling this function
    fn get_val(&mut self) -> &mut V;
    /// `is_err` or `is_ok` should be used before calling this function
    unsafe fn get_error(&self) -> &str { self._get_error().as_ref().unwrap_unchecked() }
    /// Used to bridge to Swift
    fn get_error_unsafe(&self) -> &str { unsafe { self.get_error() } }
}