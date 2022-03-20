# BuildMetadata

/// Optional build metadata identifier. This comes after `+` in a SemVer
/// version, as in `0.8.1+zstd.1.5.0`.
///
/// # Examples
///
/// Some real world build metadata idioms drawn from crates.io:
///
/// - **[libgit2-sys]** <code>0.12.20+<b>1.1.0</b></code> &mdash; for this
///   crate, the build metadata indicates the version of the C libgit2 library
///   that the Rust crate is built against.
///
/// - **[mashup]** <code>0.1.13+<b>deprecated</b></code> &mdash; just the word
///   "deprecated" for a crate that has been superseded by another. Eventually
///   people will take notice of this in Cargo's build output where it lists the
///   crates being compiled.
///
/// - **[google-bigquery2]** <code>2.0.4+<b>20210327</b></code> &mdash; this
///   library is automatically generated from an official API schema, and the
///   build metadata indicates the date on which that schema was last captured.
///
/// - **[fbthrift-git]** <code>0.0.6+<b>c7fcc0e</b></code> &mdash; this crate is
///   published from snapshots of a big company monorepo. In monorepo
///   development, there is no concept of versions, and all downstream code is
///   just updated atomically in the same commit that breaking changes to a
///   library are landed. Therefore for crates.io purposes, every published
///   version must be assumed to be incompatible with the previous. The build
///   metadata provides the source control hash of the snapshotted code.
///
/// [libgit2-sys]: https://crates.io/crates/libgit2-sys
/// [mashup]: https://crates.io/crates/mashup
/// [google-bigquery2]: https://crates.io/crates/google-bigquery2
/// [fbthrift-git]: https://crates.io/crates/fbthrift-git
///
/// # Syntax
///
/// Build metadata is a series of dot separated identifiers immediately
/// following the patch or pre-release version. Identifiers must comprise only
/// ASCII alphanumerics and hyphens: `0-9`, `A-Z`, `a-z`, `-`. Identifiers must
/// not be empty. Leading zeros *are* allowed, unlike any other place in the
/// SemVer grammar.
///
/// # Total ordering
///
/// Build metadata is ignored in evaluating `VersionReq`; it plays no role in
/// whether a `Version` matches any one of the comparison operators.
///
/// However for comparing build metadatas among one another, they do have a
/// total order which is determined by lexicographic ordering of dot-separated
/// components. Identifiers consisting of only digits are compared numerically.
/// Otherwise, identifiers are compared in ASCII sort order. Any numeric
/// identifier is always less than any non-numeric identifier.
///
/// Example:&ensp;`demo`&ensp;&lt;&ensp;`demo.85`&ensp;&lt;&ensp;`demo.90`&ensp;&lt;&ensp;`demo.090`&ensp;&lt;&ensp;`demo.200`&ensp;&lt;&ensp;`demo.1a0`&ensp;&lt;&ensp;`demo.a`&ensp;&lt;&ensp;`memo`

# Prerelease 
/// Optional pre-release identifier on a version string. This comes after `-` in
/// a SemVer version, like `1.0.0-alpha.1`
///
/// # Examples
///
/// Some real world pre-release idioms drawn from crates.io:
///
/// - **[mio]** <code>0.7.0-<b>alpha.1</b></code> &mdash; the most common style
///   for numbering pre-releases.
///
/// - **[pest]** <code>1.0.0-<b>beta.8</b></code>,&ensp;<code>1.0.0-<b>rc.0</b></code>
///   &mdash; this crate makes a distinction between betas and release
///   candidates.
///
/// - **[sassers]** <code>0.11.0-<b>shitshow</b></code> &mdash; ???.
///
/// - **[atomic-utils]** <code>0.0.0-<b>reserved</b></code> &mdash; a squatted
///   crate name.
///
/// [mio]: https://crates.io/crates/mio
/// [pest]: https://crates.io/crates/pest
/// [atomic-utils]: https://crates.io/crates/atomic-utils
/// [sassers]: https://crates.io/crates/sassers
///
/// *Tip:* Be aware that if you are planning to number your own pre-releases,
/// you should prefer to separate the numeric part from any non-numeric
/// identifiers by using a dot in between. That is, prefer pre-releases
/// `alpha.1`, `alpha.2`, etc rather than `alpha1`, `alpha2` etc. The SemVer
/// spec's rule for pre-release precedence has special treatment of numeric
/// components in the pre-release string, but only if there are no non-digit
/// characters in the same dot-separated component. So you'd have `alpha.2` &lt;
/// `alpha.11` as intended, but `alpha11` &lt; `alpha2`.
///
/// # Syntax
///
/// Pre-release strings are a series of dot separated identifiers immediately
/// following the patch version. Identifiers must comprise only ASCII
/// alphanumerics and hyphens: `0-9`, `A-Z`, `a-z`, `-`. Identifiers must not be
/// empty. Numeric identifiers must not include leading zeros.
///
/// # Total ordering
///
/// Pre-releases have a total order defined by the SemVer spec. It uses
/// lexicographic ordering of dot-separated components. Identifiers consisting
/// of only digits are compared numerically. Otherwise, identifiers are compared
/// in ASCII sort order. Any numeric identifier is always less than any
/// non-numeric identifier.
///
/// Example:&ensp;`alpha`&ensp;&lt;&ensp;`alpha.85`&ensp;&lt;&ensp;`alpha.90`&ensp;&lt;&ensp;`alpha.200`&ensp;&lt;&ensp;`alpha.0a`&ensp;&lt;&ensp;`alpha.1a0`&ensp;&lt;&ensp;`alpha.a`&ensp;&lt;&ensp;`beta`

# VersionReq
/// **SemVer version requirement** describing the intersection of some version
/// comparators, such as `>=1.2.3, <1.8`.
///
/// # Syntax
///
/// - Either `*` (meaning "any"), or one or more comma-separated comparators.
///
/// - A [`Comparator`] is an operator ([`Op`]) and a partial version, separated
///   by optional whitespace. For example `>=1.0.0` or `>=1.0`.
///
/// - Build metadata is syntactically permitted on the partial versions, but is
///   completely ignored, as it's never relevant to whether any comparator
///   matches a particular version.
///
/// - Whitespace is permitted around commas and around operators. Whitespace is
///   not permitted within a partial version, i.e. anywhere between the major
///   version number and its minor, patch, pre-release, or build metadata.

# Operator
// TODO