# Git Workflow

## Repository Structure

```
main (protected)
  └── develop
        ├── feature/*
        ├── bugfix/*
        └── hotfix/*
```

## Branch Protection Rules

### main
- ✅ Require pull request reviews (1 approver)
- ✅ Require status checks (CI build must pass)
- ✅ Require branches up to date before merging
- ✅ No force pushes
- ✅ No deletions

### develop
- ✅ Require status checks (CI build must pass)
- ✅ No force pushes

## Workflow

### Feature Development
```bash
# Create feature branch from develop
git checkout develop
git pull origin develop
git checkout -b feature/FEAT-001-webview-implementation

# Work on feature
# ... code changes ...

# Commit and push
git add .
git commit -m "feat: implement basic WebView (FEAT-001)"
git push origin feature/FEAT-001-webview-implementation

# Create PR to develop
```

### Bug Fix
```bash
git checkout develop
git pull origin develop
git checkout -b bugfix/fix-webview-loading

# Fix bug
# ... code changes ...

git add .
git commit -m "fix: resolve WebView loading issue"
git push origin bugfix/fix-webview-landing
```

### Hotfix (Production)
```bash
git checkout main
git pull origin main
git checkout -b hotfix/critical-fix

# Fix critical issue
# ... code changes ...

git add .
git commit -m "hotfix: critical production fix"
git push origin hotfix/critical-fix

# Create PR to main AND develop
```

## Commit Message Convention

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting)
- `refactor`: Code refactoring
- `test`: Test additions/modifications
- `chore`: Build/config changes

### Examples
```
feat(webview): implement basic WebView loading
fix(error): handle no internet connection gracefully
docs(readme): update setup instructions
chore(ci): add GitHub Actions workflow
```

## Release Process

### Version Numbering
Follow semantic versioning: `MAJOR.MINOR.PATCH`

- `MAJOR`: Breaking changes
- `MINOR`: New features (backwards compatible)
- `PATCH`: Bug fixes (backwards compatible)

### Release Steps
1. Create release branch from develop
2. Update version in `pubspec.yaml`
3. Update CHANGELOG.md
4. Create PR to main
5. Merge to main (triggers CI + GitHub Release)
6. Tag release
7. Merge main back to develop

---

*Created: 2026-03-16*
