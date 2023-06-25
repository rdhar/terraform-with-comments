# Changelog

- All notable changes to this project will be documented in this file.
- The format is based on [Keep a Changelog](https://keepachangelog.com/), and this project adheres to [Semantic Versioning](https://semver.org).

## [`v1.3.0`](https://github.com/rdhar/terraform-with-comments/compare/v1.2.0...v1.3.0) — 2023-06-25

## What's Changed

### Added

- Terraform force-unlock command to unlock a Terraform state lock.

### Changed

- Take workspace parameter into account for synchronous concurrency.

### Commits

- docs: reordering terraform arguments by @rdhar in https://github.com/rdhar/terraform-with-comments/pull/35
- build(deps): update hashicorp/aws requirement from ~> 4.0 to ~> 5.0 in /stacks/sample_bucket by @dependabot in https://github.com/rdhar/terraform-with-comments/pull/37
- build(deps): update hashicorp/aws requirement from ~> 4.0 to ~> 5.0 in /stacks/sample_instance by @dependabot in https://github.com/rdhar/terraform-with-comments/pull/36
- build: rename variables by @rdhar in https://github.com/rdhar/terraform-with-comments/pull/38
- docs: naming by @rdhar in https://github.com/rdhar/terraform-with-comments/pull/39
- ci: fix concurrency by @rdhar in https://github.com/rdhar/terraform-with-comments/pull/40
- ci: terraform force-unlock by @rdhar in https://github.com/rdhar/terraform-with-comments/pull/41
- ci: add workspace input to concurrency by @rdhar in https://github.com/rdhar/terraform-with-comments/pull/42
- build(deps): bump actions/checkout from 3.5.2 to 3.5.3 by @dependabot in https://github.com/rdhar/terraform-with-comments/pull/43
- build(deps): bump dflook/terraform-unlock-state from 1.34.0 to 1.35.0 by @dependabot in https://github.com/rdhar/terraform-with-comments/pull/44
- build(deps): bump dflook/terraform-new-workspace from 1.34.0 to 1.35.0 by @dependabot in https://github.com/rdhar/terraform-with-comments/pull/47
- build(deps): bump dflook/terraform-plan from 1.34.0 to 1.35.0 by @dependabot in https://github.com/rdhar/terraform-with-comments/pull/45
- build(deps): bump dflook/terraform-apply from 1.34.0 to 1.35.0 by @dependabot in https://github.com/rdhar/terraform-with-comments/pull/46
- docs: archive notice by @rdhar in https://github.com/rdhar/terraform-with-comments/pull/48

## [`v1.2.0`](https://github.com/rdhar/terraform-with-comments/compare/v1.1.0...v1.2.0) — 2023-05-23

### Added

- Support for GitHub Codespaces dev container, which offers a tailored Terraform development environment, complete with tools and runtimes to lower the barrier to entry for contributors.

### Commits

- build(deps): bump myrotvorets/set-commit-status-action from 1.1.6 to 1.1.7 by @dependabot in [#31](https://github.com/rdhar/terraform-with-comments/pull/31).
- build: support terraform dev container codespace by @rdhar in [#32](https://github.com/rdhar/terraform-with-comments/pull/32).

### New Contributors

- @dependabot made their first contribution in [#31](https://github.com/rdhar/terraform-with-comments/pull/31).

## [`v1.1.0`](https://github.com/rdhar/terraform-with-comments/compare/v1.0.0...v1.1.0) — 2023-05-22

### Added

- Commit status for ongoing workflow runs.
- Deployment status for ongoing workflow runs that apply Terraform configuration.
- Changelog documentation, adhering to semantic versioning.
- Usage examples of workflow, with copy-paste code snippets.
- Links to pull requests demonstrating usage of the workflow.
- Video walkthrough of workflow usage pattern.

### Changed

- Usage of custom s3_bucket module to demonstrate functionality.

### Fixed

- Backend configuration for sample Terraform configuration stacks.

### Security

- Documented best practices for hardening CI/CD pipeline security by pinning all GitHub Actions to specific SHA hashes.

### Commits

- ci: add ongoing commit status by @rdhar in [#12](https://github.com/rdhar/terraform-with-comments/pull/12).
- ci: add deployment status of terraform apply by @rdhar in [#13](https://github.com/rdhar/terraform-with-comments/pull/13).
- ci: reorder parsing of environment variables by @rdhar in [#14](https://github.com/rdhar/terraform-with-comments/pull/14).
- docs: add changelog by @rdhar in [#15](https://github.com/rdhar/terraform-with-comments/pull/15).
- build: use s3 bucket module by @rdhar in [#16](https://github.com/rdhar/terraform-with-comments/pull/16).
- docs: add terraform workflow usage info by @rdhar in [#17](https://github.com/rdhar/terraform-with-comments/pull/17).
- fix: stack backend configuration by @rdhar in [#19](https://github.com/rdhar/terraform-with-comments/pull/19).
- docs: usage examples with code by @rdhar in [#20](https://github.com/rdhar/terraform-with-comments/pull/20).
- docs: improve wording in roadmap workaround by @rdhar in [#21](https://github.com/rdhar/terraform-with-comments/pull/21).
- docs: update example pr links by @rdhar in [#24](https://github.com/rdhar/terraform-with-comments/pull/24).
- docs: improve terraform workflow usage steps by @rdhar in [#29](https://github.com/rdhar/terraform-with-comments/pull/29).

## [`v1.0.0`](https://github.com/rdhar/terraform-with-comments/commits/v1.0.0) — 2023-05-20

### Added

- Initial prototype of reusable workflow and associated caller for Terraform actions.
- Sample Terraform configuration stacks for bucket and instance templates.
- Boilerplate documentation and permissive license.

### Commits

- chore: update license ownership by @rdhar in [#1](https://github.com/rdhar/terraform-with-comments/pull/1).
- chore: add default code ownership by @rdhar in [#2](https://github.com/rdhar/terraform-with-comments/pull/2).
- chore: gitignore .env by @rdhar in [#3](https://github.com/rdhar/terraform-with-comments/pull/3).
- feat: automate github actions updates by @rdhar in [#4](https://github.com/rdhar/terraform-with-comments/pull/4).
- docs: boilerplate contributions and license by @rdhar in [#6](https://github.com/rdhar/terraform-with-comments/pull/6).
- docs: contributions wording by @rdhar in [#7](https://github.com/rdhar/terraform-with-comments/pull/7).
- build: placeholder sample terraform stack by @rdhar in [#8](https://github.com/rdhar/terraform-with-comments/pull/8).
- docs: add project overview by @rdhar in [#9](https://github.com/rdhar/terraform-with-comments/pull/9).
- build: add sample bucket and instance templates by @rdhar in [#10](https://github.com/rdhar/terraform-with-comments/pull/10).
- ci: add initial prototype of reusable workflow and caller by @rdhar in [#11](https://github.com/rdhar/terraform-with-comments/pull/11).

### New Contributors

- @rdhar made their first contribution in [#1](https://github.com/rdhar/terraform-with-comments/pull/1).
