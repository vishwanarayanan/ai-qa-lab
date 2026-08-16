# AI-QA Lab — Architecture Overview

## 1. Purpose

AI-QA Lab is an AI-augmented end-to-end testing and failure
investigation platform.

The platform is designed around a conventional Playwright-based
test automation foundation and adds AI capabilities for
investigating test failures.

The System Under Test (SUT) is the Practice Software Testing
Toolshop application.

---

## 2. Architectural Goal

The primary architectural goal is to keep deterministic test
automation independent from AI capabilities.

Automated tests must remain executable even if the AI services
are unavailable.

AI is an enhancement to the testing workflow rather than a
dependency of the testing framework.

---

## 3. System Context

The system has three primary actors/systems:

### Tester / Developer

The person responsible for executing tests and investigating
test failures.

### AI-QA Lab

The testing and AI-assisted investigation platform.

### Toolshop

The web application being tested.

The high-level relationship is:

Tester / Developer
        |
        v
    AI-QA Lab
        |
        v
     Toolshop

---

## 4. Container Architecture

AI-QA Lab is divided into several major containers.

### Test Automation

Technology:

- TypeScript
- Playwright

Responsibilities:

- Execute E2E tests
- Interact with the Toolshop application
- Capture test artifacts
- Produce test execution results

---

### Test Intelligence

Technology:

- TypeScript

Responsibilities:

- Process Playwright results
- Normalize failures
- Extract failure information
- Prepare structured evidence for AI analysis

---

### AI Analysis

Technology:

- TypeScript
- LLM

Responsibilities:

- Analyze failures
- Identify likely causes
- Explain failures
- Generate investigation recommendations

---

### Knowledge Service

Technology:

- RAG

Responsibilities:

- Retrieve relevant project knowledge
- Retrieve testing documentation
- Retrieve historical failure information
- Provide context for AI analysis

---

### MCP Server

Technology:

- MCP

Responsibilities:

Expose controlled testing capabilities to AI clients.

Potential capabilities include:

- Run a test
- Run a test suite
- Retrieve test results
- Retrieve screenshots
- Retrieve traces
- Search test history

---

### Test Results Store

Responsibilities:

- Store test results
- Store failure information
- Store historical test data
- Support investigation workflows

---

## 5. Primary Testing Flow

The normal testing workflow is:

Developer / CI
       |
       v
Test Automation
       |
       v
Toolshop
       |
       v
Test Intelligence
       |
       v
Test Results Store

This workflow does not depend on the AI layer.

---

## 6. AI Investigation Flow

When a test fails, AI-assisted investigation can be introduced:

Test Failure
     |
     v
Test Intelligence
     |
     v
AI Analysis
     |
     +------> Knowledge Service
     |
     +------> MCP Server
     |
     v
Investigation Result

The LLM provides reasoning.

RAG provides contextual knowledge.

MCP provides controlled access to testing capabilities.

---

## 7. Architectural Principles

### Separation of concerns

Browser automation, test intelligence, AI reasoning,
knowledge retrieval and tool access are separate responsibilities.

### AI independence

Normal E2E test execution must not depend on the AI layer.

### Incremental complexity

AI capabilities will be introduced only after the conventional
test automation foundation is working.

### Traceability

Important architectural decisions will be documented using
Architecture Decision Records (ADRs).

### Architecture as code

The C4 architecture model is maintained as Structurizr DSL
and stored in version control.

---

## 8. Architecture Documentation

The architecture is modeled using the C4 model and Structurizr.

The source model is:

`workspace.dsl`

Architecture decisions are documented separately using ADRs.

---

## 9. Planned Evolution

The architecture will evolve through the following stages:

1. Playwright test automation
2. Test result processing
3. Failure intelligence
4. LLM-based failure analysis
5. RAG-based contextual retrieval
6. MCP-based testing tools
7. AI agent orchestration
8. CI/CD integration

Each major architectural change will be documented before
implementation.

---

## 10. Current Status

Current phase:

**Architecture Foundation**

Completed:

- C4 System Context model
- C4 Container model
- Initial Structurizr workspace
- Initial architecture boundaries

Next:

**Playwright Test Automation Foundation**
