use semver::Version;

#[test]
fn parsed() {
    panic!("{:?}",Version::parse("1.0.4-alpha.4").unwrap().to_string())
}