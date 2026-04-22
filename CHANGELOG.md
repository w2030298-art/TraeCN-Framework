# Changelog

All notable changes to this project are documented in this file.

## [v1.3.7] - 2026-04-22

### Changed

- Reworked the top section of `README.md` to make the public repository easier to understand on first visit.
- Grouped entry links by purpose so usage, governance and release paths are easier to scan.

## [v1.3.6] - 2026-04-22

### Fixed

- Replaced local documentation links with GitHub-compatible relative links across public markdown files.

### Changed

- Updated `README.md`, `docs/README.md`, `docs/versioning.md`, `docs/release-checklist.md` and `CONTRIBUTING.md` to keep the public navigation usable on GitHub.

## [v1.3.5] - 2026-04-22

### Added

- Added `.github/ISSUE_TEMPLATE/bug_report.md` and `feature_request.md` to standardize defect and idea intake.
- Added `.github/ISSUE_TEMPLATE/config.yml` to guide users toward the contribution guide and roadmap.
- Added `docs/roadmap.md` to define the current `v1.4.0` direction and release boundary.

### Changed

- Updated `README.md`, `docs/README.md` and `CONTRIBUTING.md` to expose the roadmap and issue workflow.

## [v1.3.4] - 2026-04-22

### Added

- Added `docs/github-release-template.md` as a reusable GitHub Release description template.

### Changed

- Updated `README.md`, `docs/README.md` and `docs/release-checklist.md` to expose the new release template entry.

## [v1.3.3] - 2026-04-22

### Added

- Added `CONTRIBUTING.md` to document contribution flow, root-level boundaries and commit expectations.
- Added `docs/release-checklist.md` to standardize release preparation, tag creation and release notes.
- Added `.github/PULL_REQUEST_TEMPLATE.md` to keep pull requests consistent and reviewable.

### Changed

- Updated `README.md`, `docs/README.md` and `docs/versioning.md` to expose governance and release workflow entry points.

## [v1.3.2] - 2026-04-22

### Changed

- Updated `README.md` to reflect the actual public repository entry structure.
- Added root-directory rules so public entry files stay in the repository root and non-public artifacts stay out.
- Updated `docs/README.md` to document the root-level placement policy for public docs and reusable modules.

## [v1.3.1] - 2026-04-22

### Added

- Added `docs/README.md` as the public documentation index.
- Added `docs/versioning.md` to define versioning, tagging and release flow.
- Added repository-level `CHANGELOG.md` for version tracking.

### Changed

- Updated `README.md` to link architecture, versioning and changelog docs.
- Clarified that public docs live under `docs/` while internal design notes stay under `.trae/documents/`.

## [v1.3.0] - 2026-04-21

### Added

- Added Global Hooks with `pre-edit`, `post-build`, `on-error` and `pre-push` lifecycle hooks.
- Added `.trae/config.md` as the system config center with master switches.

### Changed

- Improved Coordinator automation so preprocessing can run silently based on configuration.

## [v1.2.0] - 2026-04-21

### Added

- Added built-in `skill-creator` capability for modeling complex flows into reusable skills.

### Changed

- Upgraded error handling to Root Cause Self-Healing.
- Upgraded memory loading strategy with Associative Memory lookup.
- Standardized skill frontmatter with versioned metadata.

## [v1.1.0] - 2026-04-21

### Added

- Added Self-Healing Loop as a mandatory modify-diagnose-fix-verify flow.
- Added Cascade Mode to proactively inspect linter and terminal errors.

### Changed

- Evolved the framework from reactive instruction handling to intent-aware coordination.
- Refactored core rules to formalize proactive repair and sensing behavior.

## [v1.0.9] - 2026-04-21

### Added

- Added `Modules/` as the reusable asset layer.
- Added modern UI/UX guidance including Glassmorphism-oriented design language.

### Changed

- Improved Windows PowerShell command compatibility.
- Adjusted output strategy for Windows terminal encoding constraints.

## [v1.0.8] - 2026-04-21

### Changed

- Unified architecture language to Coordinator + Rules + Skills + Memory + Workspace.
- Reclassified `/初始化`, `/重置` and `/结束` as Coordinator built-in commands.
- Added `.trae/documents/` as the internal design-doc directory.

## [v1.0.7] - 2026-04-20

### Changed

- Completed multi-round consistency audit across rules, skills and README.
- Added execution declarations to all framework skills.
- Improved session management with long-term memory persistence.

## [v1.0.6] - 2026-04-20

### Changed

- Enforced the "trigger means execute" rule for skills.
- Fixed the behavior where skills only described actions without performing them.

## [v1.0.5] - 2026-04-20

### Changed

- Improved session handoff with long-term memory consolidation.
- Ensured memory files continue to accumulate useful state instead of staying blank.

## [v1.0.4] - 2026-04-20

### Changed

- Fixed broken file references and mismatched triggers.
- Synced the framework structure to 7 rules and 10 skills at that stage.
- Added missing knowledge directory creation and backfilled knowledge files.

## [v1.0.3] - 2026-04-20

### Added

- Added `knowledge/` with `errors.md`, `patterns.md` and `decisions.md`.

### Changed

- Refactored rules from 8 files to 7 focused files.
- Defined automatic-save triggers and error grading.
- Removed empty and duplicate memory files.

## [v1.0.2] - 2026-04-19

### Changed

- Completed broad consistency fixes across naming, file references and framework scope.

## [v1.0.1] - 2026-04-19

### Added

- Initial public framework release.
- Basic framework structure and core skills.
