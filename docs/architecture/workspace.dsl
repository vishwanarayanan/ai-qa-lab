workspace "AI-QA Lab" "AI-augmented E2E testing and failure investigation platform." {

    !identifiers hierarchical

    model {
        tester = person "Tester / Developer" "Uses AI-QA Lab."

        toolshop = softwareSystem "Toolshop" "System Under Test."

        aiQaLab = softwareSystem "AI-QA Lab" "E2E testing and AI-assisted failure investigation platform." {
            testAutomation = container "Test Automation" "Executes E2E tests." "TypeScript, Playwright"
            testIntelligence = container "Test Intelligence" "Processes test results." "TypeScript"
            aiAnalysis = container "AI Analysis" "Analyzes test failures." "TypeScript, LLM"
            knowledgeService = container "Knowledge Service" "Retrieves testing knowledge." "RAG"
            mcpServer = container "MCP Server" "Provides tools to AI clients." "MCP"
            resultsStore = container "Test Results Store" "Stores test results and history." "Database"
        }

        tester -> aiQaLab "Uses"

        aiQaLab.testAutomation -> toolshop "Tests"

        aiQaLab.testAutomation -> aiQaLab.testIntelligence "Publishes results"

        aiQaLab.testIntelligence -> aiQaLab.resultsStore "Stores results"

        aiQaLab.aiAnalysis -> aiQaLab.testIntelligence "Reads failure information"

        aiQaLab.aiAnalysis -> aiQaLab.knowledgeService "Retrieves knowledge"

        aiQaLab.knowledgeService -> aiQaLab.resultsStore "Retrieves historical information"

        aiQaLab.aiAnalysis -> aiQaLab.mcpServer "Uses tools"

        aiQaLab.mcpServer -> aiQaLab.testAutomation "Runs tests"
    }

    views {
        systemContext aiQaLab "SystemContext" {
            include *
            autoLayout
        }

        container aiQaLab "ContainerArchitecture" {
            include *
            autoLayout
        }

        styles {
            element "Person" {
                shape Person
                background #08427b
                color #ffffff
            }

            element "Software System" {
                background #1168bd
                color #ffffff
            }

            element "Container" {
                background #438dd5
                color #ffffff
            }
        }
    }
}
