# Changelog

## [Unreleased]
### Added
- Fish shell integration for all profiles
- Custom Fish prompt with profile name and Git branch
- Centralized Fish launch in flake.nix
- Kotlin profile with Kotlin, Gradle, JDK21, Android Studio
- Security profile with osv-scanner and pip-audit

### Changed
- Renamed `hugo` profile to `web`
- Removed package versions block from README
- Updated .gitignore with result, .direnv/, *.log
- Updated nixhelp script with all current profiles

### Fixed
- Fish shell automatically launches in all Nix environments

## [1.0.0] - 2024-11-20
### Added
- Initial release with 5 development environments
- DevOps profile with Terraform, kubectl, AWS CLI
- Python profile with Python 3.13, pip, uv
- Docker profile with Docker and compose
- Hugo profile for static sites
- Default profile with basic dev tools
- Auto-installation script
- MIT License
