# ⚡ Rapid Scrum Framework - 10-Minute Sprints

## Overview

This project uses **accelerated scrum** with 10-minute sprint cycles for rapid AI-driven development.

---

## 🕐 Sprint Cycle (10 Minutes)

```
┌─────────────────────────────────────────────────────────────┐
│                    10-MINUTE SPRINT                         │
├──────────────┬──────────────┬──────────────┬───────────────┤
│   Planning   │  Development │    Review    │  Retrospective│
│   (2 min)    │   (5 min)    │   (2 min)    │    (1 min)    │
└──────────────┴──────────────┴──────────────┴───────────────┘
```

### Phase Breakdown

| Phase | Duration | Activities | Owner |
|-------|----------|------------|-------|
| **Planning** | 2 min | Story selection, task breakdown | Scrum Master + All |
| **Development** | 5 min | Code implementation | Dev Agent |
| **Review** | 2 min | Demo, QA verification | QA + PM |
| **Retrospective** | 1 min | What went well/poorly | All |

---

## 🤖 AI Agent Roles

### 1. Product Manager Agent (`pm-agent`)
**Responsibilities:**
- Define UI/UX specs (rapid iterations)
- Prioritize backlog for each sprint
- Accept/reject completed work

**Response Time:** < 1 minute

---

### 2. Business Analyst Agent (`ba-agent`)
**Responsibilities:**
- Convert PM specs into micro user stories
- Define acceptance criteria (specific, testable)
- Clarify requirements instantly

**Response Time:** < 1 minute

---

### 3. Scrum Master Agent (`scrum-master-agent`)
**Responsibilities:**
- Start/end sprints automatically
- Track time and send reminders
- Remove blockers immediately
- Update sprint board

**Response Time:** < 30 seconds

---

### 4. Developer Agent (`dev-agent`)
**Responsibilities:**
- Implement features in 5-minute bursts
- Commit code frequently
- Fix bugs immediately

**Response Time:** < 2 minutes

---

### 5. QA Agent (`qa-agent`)
**Responsibilities:**
- Create test cases in parallel with dev
- Verify completed work instantly
- Report bugs with reproduction steps

**Response Time:** < 1 minute

---

## 📋 Sprint Workflow

### Pre-Sprint (Automated)
```
[Scrum Master] → Creates sprint issue
[Scrum Master] → Notifies all agents
[BA] → Prepares user stories
```

### During Sprint
```
[0:00] Sprint Start → Scrum Master
[0:30] Planning Complete → All Agents
[2:00] Development Starts → Dev Agent
[7:00] Development Complete → Dev Agent
[7:30] QA Review Starts → QA Agent
[9:00] Review Complete → QA + PM
[9:30] Retrospective → All
[10:00] Sprint End → Scrum Master
```

### Post-Sprint (Automated)
```
[Scrum Master] → Updates sprint board
[Scrum Master] → Triggers CI build
[Scrum Master] → Creates next sprint issue
```

---

## 🎯 Sprint Backlog Structure

### Epic: Doubao WebView App

#### Sprint 1: Project Setup (10 min)
- [x] Initialize Flutter project
- [x] Create basic structure
- [x] Set up GitHub repo

#### Sprint 2: Core WebView (10 min)
- [ ] WebView controller
- [ ] Load Doubao.com
- [ ] Basic navigation

#### Sprint 3: Environment Config (10 min)
- [ ] Build flavors
- [ ] .env files
- [ ] URL configuration

#### Sprint 4: Error Handling (10 min)
- [ ] No internet detection
- [ ] Error UI
- [ ] Retry logic

#### Sprint 5: Navigation Controls (10 min)
- [ ] Back/Forward buttons
- [ ] Refresh button
- [ ] Loading indicator

#### Sprint 6: External Links (10 min)
- [ ] URL interception
- [ ] Domain whitelist
- [ ] External browser launch

#### Sprint 7: Polish & UI (10 min)
- [ ] App bar styling
- [ ] Progress bar
- [ ] Error messages

#### Sprint 8: CI/CD Setup (10 min)
- [ ] GitHub Actions workflow
- [ ] APK build automation
- [ ] Artifact upload

#### Sprint 9: Testing (10 min)
- [ ] QA test cases
- [ ] Bug fixes
- [ ] Final review

#### Sprint 10: Release (10 min)
- [ ] Version bump
- [ ] Release notes
- [ ] GitHub release

---

## 📊 Sprint Board

| Sprint | Status | Goal | Completed |
|--------|--------|------|-----------|
| 1 | ✅ Done | Project Setup | 100% |
| 2 | 🟡 Active | Core WebView | In Progress |
| 3 | ⚪ Pending | Environment Config | - |
| 4 | ⚪ Pending | Error Handling | - |
| 5 | ⚪ Pending | Navigation Controls | - |
| 6 | ⚪ Pending | External Links | - |
| 7 | ⚪ Pending | Polish & UI | - |
| 8 | ⚪ Pending | CI/CD Setup | - |
| 9 | ⚪ Pending | Testing | - |
| 10 | ⚪ Pending | Release | - |

---

## 🔔 Automated Reminders

### GitHub Actions Triggers

| Event | Action | Workflow |
|-------|--------|----------|
| Sprint Start | Create issue, notify agents | `sprint-start.yml` |
| 5 min mark | Notify dev to wrap up | `sprint-timer.yml` |
| Sprint End | Close sprint, trigger CI | `sprint-end.yml` |
| Build Complete | Notify team | `build-notification.yml` |

---

## 📈 Metrics & Velocity

### Tracking

| Metric | Target | Current |
|--------|--------|---------|
| Sprint Duration | 10 min | 10 min |
| Stories per Sprint | 3-5 | TBD |
| Velocity | 5 pts/sprint | TBD |
| Defect Rate | < 10% | TBD |

### Burndown Chart (Per Sprint)
```
Time    | Remaining Work
--------|---------------
0:00    | ████████████ 100%
2:30    | ████████░░░░  70%
5:00    | █████░░░░░░░  50%
7:30    | ██░░░░░░░░░░  20%
10:00   | ░░░░░░░░░░░░   0%
```

---

## 🚨 Escalation Protocol

### If Sprint Fails
1. **Immediate:** Scrum Master calls timeout
2. **Root Cause:** 1-minute retrospective
3. **Action:** Move story to next sprint or split
4. **Resume:** Start new sprint immediately

### If Blocker Detected
1. **Dev Agent:** Flags blocker in sprint issue
2. **Scrum Master:** Removes blocker within 1 min
3. **Resume:** Dev continues immediately

---

## 🎯 Definition of Done (Per Sprint)

- [ ] Code implemented
- [ ] Code committed to GitHub
- [ ] CI build passes
- [ ] QA verification complete
- [ ] PM acceptance (if UI/UX)
- [ ] Sprint retrospective done

---

## 📝 Sprint Template

```markdown
# Sprint {N} - {Goal}

**Duration:** {Start Time} - {End Time} (10 min)
**Status:** {Planning/Dev/Review/Retro/Done}

## Goals
- [ ] Story 1
- [ ] Story 2
- [ ] Story 3

## Timeline
- [ ] 0:00 - Sprint Start
- [ ] 2:00 - Planning Complete
- [ ] 7:00 - Development Complete
- [ ] 9:00 - Review Complete
- [ ] 10:00 - Sprint End

## Agent Updates
- **PM:** 
- **BA:** 
- **Dev:** 
- **QA:** 
- **Scrum Master:** 

## Blockers
- None

## Retrospective
- 🟢 Went well:
- 🔴 Improve:
- 💡 Action:
```

---

## 🔄 Continuous Deployment

Every successful sprint triggers:
1. Code push to `develop` branch
2. CI build (APK generation)
3. Artifact upload
4. Notification to team

After every 5 sprints:
1. Merge to `main`
2. GitHub Release
3. Version bump

---

*Created: 2026-03-16*
*Framework: Rapid Scrum (10-min sprints)*
*Team: Multi-AI Agent Scrum Team*
