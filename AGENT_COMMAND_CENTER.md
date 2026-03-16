# 🤖 AI Agent Command Center

## Quick Commands

### Assign Work to Agents
```bash
# Create issue with agent assignment
gh issue create --title "[FEAT-001] Basic WebView Implementation" \
  --body "See user-stories.md" \
  --label "feature,user-story" \
  --assignee "dev-agent"
```

### Sprint Management
```bash
# Start sprint
gh issue create --title "Sprint 1 Kickoff" --label "sprint-planning"

# Daily standup
gh issue create --title "Daily Standup - $(date +%Y-%m-%d)" --label "daily-standup"

# Sprint review
gh issue create --title "Sprint 1 Review" --label "sprint-review"
```

### Build & Release
```bash
# Trigger manual build
gh workflow run flutter-ci.yml

# Check build status
gh run list

# Create release
gh release create v1.0.0 --notes "Initial release"
```

### Monitor CI/CD
```bash
# Watch latest build
gh run watch

# View build logs
gh run view --log
```

---

## Agent Status Commands

### Check Agent Activity
```bash
# List recent issues by agent
gh issue list --assignee dev-agent --state all

# Check PR status
gh pr list --state open
```

### Notify Agents
```bash
# Comment on issue to notify agent
gh issue comment <issue-number> --body "@dev-agent Please review"
```

---

## GitHub CLI Setup

```bash
# Install GitHub CLI
# macOS: brew install gh
# Linux: sudo apt install gh
# Windows: winget install GitHub.cli

# Authenticate
gh auth login

# Verify
gh repo view andycky/webview_app
```

---

*Created: 2026-03-16*
