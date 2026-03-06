plugins {
    `java-library`
    id("software.amazon.smithy.gradle.smithy-base") version "1.4.0"
}

dependencies {
    // Add the code generation plugins to the smithy build classpath
    smithyBuild("software.amazon.smithy.java:client-codegen:0.0.3")
    
    // Add the client-core dependency needed by the generated code
    implementation("software.amazon.smithy.java:client-core:0.0.3")
}

// Add generated Java sources to the main sourceSet so they are compiled alongside
// any other java code in your package
afterEvaluate {
    val clientPath = smithy.getPluginProjectionPath(smithy.sourceProjection.get(), "java-client-codegen")
    sourceSets {
        main {
            java {
                srcDir(clientPath)
            }
        }
    }
}

// Ensure client files are generated before java compilation is executed.
tasks.named("compileJava") {
    dependsOn("smithyBuild")
}

repositories {
    mavenLocal()
    mavenCentral()
}