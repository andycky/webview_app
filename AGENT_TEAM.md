# Multi-AI Agent Scrum Team Configuration

## 🤖 AI Agent Roles

This project uses multiple AI agents to simulate a full scrum team. Each agent has specific responsibilities.

---

## Agent Assignments

### 1. Product Manager Agent
**Agent ID:** `pm-agent`  
**Model:** qwen3.5-plus  
**Responsibilities:**
- Design UI/UX mockups and specifications
- Define feature priorities
- Review and approve deliverables
- Create product roadmap

**Triggers:**
- New feature requests
- Sprint planning
- Design reviews

**Output:** UI specs, feature documents, priority backlog

---

### 2. Business Analyst Agent
**Agent ID:** `ba-agent`  
**Model:** qwen3.5-plus  
**Responsibilities:**
- Translate PM specs into detailed requirements
- Write user stories with acceptance criteria
- Document functional requirements
- Clarify requirements for developers

**Triggers:**
- PM deliverables received
- Sprint planning
- Requirement changes

**Output:** User stories, requirement docs, acceptance criteria

---

### 3. Scrum Master Agent
**Agent ID:** `scrum-master-agent`  
**Model:** qwen3.5-plus  
**Responsibilities:**
- Create and maintain sprint plans
- Track progress and velocity
- Send reminders for ceremonies
- Remove blockers
- Facilitate standups, reviews, retrospectives

**Triggers:**
- Sprint start/end
- Daily standup time
- Blocker detection
- Progress tracking

**Output:** Sprint plans, progress reports, reminders

---

### 4. Developer Agent
**Agent ID:** `dev-agent`  
**Model:** qwen3.5-plus  
**Responsibilities:**
- Implement Flutter code
- Code reviews
- Fix bugs
- Update documentation
- CI/CD maintenance

**Triggers:**
- User stories assigned
- Bug reports
- Code review requests
- Build failures

**Output:** Code, PRs, bug fixes, technical docs

---

### 5. QA Agent
**Agent ID:** `qa-agent`  
**Model:** qwen3.5-plus  
**Responsibilities:**
- Create test plans and test cases
- Execute manual/automated tests
- Report bugs
- Verify fixes
- Release sign-off

**Triggers:**
- Feature complete notification
- Bug fix verification
- Release preparation

**Output:** Test reports, bug reports, release approval

---

## 🔄 Agent Workflow

```
┌─────────────┐
│   PM Agent  │── Design specs ──┐
└─────────────┘                  │
                                 ▼
┌─────────────┐          ┌─────────────┐
│  BA Agent   │◄─────────│ Requirements│
└─────────────┘          └─────────────┘
         │
         │ User stories
         ▼
┌─────────────┐          ┌─────────────┐
│Scrum Master │─────────►│ Sprint Plan │
└─────────────┘          └─────────────┘
                                │
                                │ Assign
                                ▼
┌─────────────┐          ┌─────────────┐
│  Dev Agent  │─────────►│    Code     │
└─────────────┘          └─────────────┘
                                │
                                │ Complete
                                ▼
┌─────────────┐          ┌─────────────┐
│   QA Agent  │◄─────────│    Test     │
└─────────────┘          └─────────────┘
         │
         │ Pass/Fail
         ▼
┌─────────────┐
│   Release   │
└─────────────┘
```

---

## 📋 Agent Communication Protocol

### Message Format
```
[AGENT:<role>] <message>
[PRIORITY:<low|medium|high|critical>]
[CONTEXT:<sprint-id|story-id|bug-id>]
```

### Example Messages
```
[AGENT:scrum-master] Sprint 1 starts today. All agents please confirm readiness.
[PRIORITY:high] [CONTEXT:sprint-1]

[AGENT:dev] FEAT-001 implementation complete. Ready for QA.
[PRIORITY:medium] [CONTEXT:feat-001]

[AGENT:qa] FEAT-001 testing complete. 2 bugs found.
[PRIORITY:high] [CONTEXT:feat-001]
```

---

## 🎯 Sprint Ceremony Automation

### Daily Standup
**Time:** 09:00 UTC daily  
**Agent:** Scrum Master  
**Action:** Poll each agent for status, compile report

### Sprint Planning
**Trigger:** Sprint start  
**Agent:** Scrum Master + All  
**Action:** Review backlog, assign stories, estimate

### Sprint Review
**Trigger:** Sprint end  
**Agent:** Scrum Master + PM + Dev  
**Action:** Demo completed work

### Retrospective
**Trigger:** Sprint end  
**Agent:** Scrum Master + All  
**Action:** Review what went well/poorly

---

## 🔧 Configuration

### Agent Settings
```yaml
agents:
  pm-agent:
    model: qwen3.5-plus
    thinking: on
    timeout: 300
  ba-agent:
    model: qwen3.5-plus
    thinking: on
    timeout: 300
  scrum-master-agent:
    model: qwen3.5-plus
    thinking: off
    timeout: 120
  dev-agent:
    model: qwen3.5-plus
    thinking: on
    timeout: 600
  qa-agent:
    model: qwen3.5-plus
    thinking: on
    timeout: 300
```

### Reminders
- Daily standup: 09:00 UTC
- Sprint end reminder: 2 days before
- Code review reminder: 24h after PR

---

## 📊 Agent Metrics

| Metric | Target | Tracking |
|--------|--------|----------|
| Response Time | < 5 min | Scrum Master |
| Task Completion | 100% sprint goals | Scrum Master |
| Bug Detection Rate | > 90% | QA Agent |
| Code Quality | > 80% analysis pass | Dev Agent |

---

## 🚀 Getting Started

1. **Initialize agents:** Each agent reads this file
2. **Sprint 0 kickoff:** Scrum Master initiates
3. **Begin workflow:** PM → BA → Dev → QA → Release

---

*Created: 2026-03-16*
*Version: 1.0*
*Team: Multi-AI Scrum Team*
