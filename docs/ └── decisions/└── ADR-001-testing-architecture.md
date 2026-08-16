# ADR-001: Testing Architecture

## Status

Accepted

## Date

2026-08-16

## Context

AI-QA Lab is being developed as an E2E testing and AI-assisted
test investigation platform.

The system under test is the Toolshop application.

The project needs a reliable conventional testing foundation before
AI capabilities are introduced.

The architecture therefore needs to separate:

- Browser automation
- Test execution
- Test result processing
- AI reasoning
- Knowledge retrieval
- AI tool access

## Decision

We will build the project around a Playwright + TypeScript E2E
testing framework.

The architecture will contain the following major responsibilities:

### Test Automation

Responsible for:

- Browser automation
- E2E test execution
- API interactions where appropriate
- Screenshots
- Traces
- Test artifacts

Technology:

- Playwright
- TypeScript

### Test Intelligence

Responsible for:

- Processing test results
- Normalizing failures
- Extracting useful failure information
- Preparing evidence for AI analysis

### AI Analysis

Responsible for:

- Failure analysis
- Failure classification
- Generating explanations
- Producing investigation recommendations

An LLM will provide the reasoning capability.

### Knowledge / RAG

Responsible for:

- Retrieving relevant project documentation
- Retrieving previous failure information
- Providing contextual information to the AI

### MCP Server

Responsible for exposing controlled testing and investigation
capabilities to AI clients.

Examples may include:

- Run a test
- Run a test suite
- Retrieve test results
- Retrieve screenshots
- Retrieve traces

### Test Results Store

Responsible for persistent test execution information,
failure history and relevant artifacts.

## Architectural principle

The conventional E2E testing system must work independently
of the AI layer.

The AI layer enhances the testing workflow rather than becoming
a prerequisite for executing tests.

Therefore:

Developer / CI
    ↓
Playwright
    ↓
Toolshop
    ↓
Test Results
    ↓
AI Analysis

AI capabilities are introduced around this foundation.

## Consequences

### Positive

- The E2E framework remains independently usable.
- AI failures cannot prevent normal test execution.
- Each architectural responsibility has a clear boundary.
- AI capabilities can be introduced incrementally.
- The system can be tested independently at multiple levels.

### Negative

- More components need to be designed and maintained.
- Test results need a consistent data model.
- AI integration introduces additional infrastructure.
- RAG and MCP increase architectural complexity.

## Alternatives considered

### AI-first testing

Rejected.

The project should first establish a reliable deterministic
testing foundation.

### Playwright tests directly calling an LLM

Rejected.

Browser automation and AI reasoning should remain separate
responsibilities.

### MCP as the core testing framework

Rejected.

MCP should expose capabilities to AI clients rather than replace
the underlying Playwright test framework.
