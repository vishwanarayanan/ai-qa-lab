workspace "AI-QA Lab" "AI-augmented E2E testing and failure investigation platform." {

    model {

        tester = person "Tester / Developer"
            "Uses AI-QA Lab to execute automated tests and investigate failures."

        toolshop = softwareSystem "Toolshop"
            "Practice Software Testing Toolshop application used as the System Under Test."

        aiQaLab = softwareSystem "AI-QA Lab"
            "AI-augmented E2E testing and failure investigation platform." {

            testAutomation = container "Test Automation"
                "Executes E2E tests against the Toolshop application and produces test artifacts."
                "TypeScript, Playwright"

            testIntelligence = container "Test Intelligence"
                "Processes test results and extracts structured failure information."
                "TypeScript"

            aiAnalysis = container "AI Analysis"
                "Analyzes test failures and produces investigation results."
                "TypeScript, LLM"

            knowledgeService = container "Knowledge Service"
                "Retrieves relevant project and historical testing knowledge."
                "RAG"

            mcpServer = container "MCP Server"
                "Exposes controlled testing and investigation capabilities to AI clients."
                "MCP"

            resultsStore = container "Test Results Store"
                "Stores test results, failure history and investigation artifacts."
                "Database"
        }

        tester -> testAutomation
            "Runs automated tests"

        testAutomation -> toolshop
            "Tests through browser automation"

        testAutomation -> testIntelligence
            "Publishes test results"

        testIntelligence -> resultsStore
            "Stores results and failure information"

        aiAnalysis -> testIntelligence
            "Reads test results and failure information"

        aiAnalysis -> knowledgeService
            "Retrieves relevant knowledge"

        knowledgeService -> resultsStore
            "Retrieves historical test information"

        aiAnalysis -> mcpServer
            "Uses testing and investigation tools"

        mcpServer -> testAutomation
            "Runs tests and browser operations"

        mcpServer -> testIntelligence
            "Retrieves test results"
    }

    views {

        systemContext aiQaLab "SystemContext" {
            include *
            autoLayout
            title "AI-QA Lab — System Context"
        }

        container aiQaLab "ContainerArchitecture" {
            include *
            autoLayout
            title "AI-QA Lab — Container Architecture"
        }

        styles {

            element "Person" {
                shape person
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
