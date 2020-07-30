#!/usr/bin/env groovy

node('master') {
    try {
        stage('build') {
            // Checkout the app at the given commit sha from the webhook
            checkout scm
            // Install dependencies, create a new .env file and generate a new key, just for testing
            sh "composer install -vvv"
            sh "cp .env.example .env"
            // Run any static asset building, if needed
            // sh "npm install && gulp --production"
        }

        stage('test') {
            // Run any testing suites
            sh "./vendor/bin/phpunit ./tests"
        }
        
        stage('SonarQube Analysis') {
            sh "/home/jenkins/tools/hudson.plugins.sonar.SonarRunnerInstallation/sonarqubescanner/bin/sonar-scanner -Dsonar.host.url=http://localhost:9000 -Dsonar.projectName=devupspackage -Dsonar.projectVersion=1.0 -Dsonar.projectKey=devupspackage:app -Dsonar.sources=. -Dsonar.projectBaseDir=/home/jenkins/workspace/devups-package"
        }

        stage('deploy') {
            // If we had ansible installed on the server, setup to run an ansible playbook
            // sh "ansible-playbook -i ./ansible/hosts ./ansible/deploy.yml"
            sh "echo 'WE ARE DEPLOYING'"
        }
    } catch(error) {
        throw error
    } finally {
        // Any cleanup operations needed, whether we hit an error or not
    }

}
