pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        // Checkout the app at the given commit sha from the webhook
        checkout scm
        // Install dependencies, create a new .env file and generate a new key, just for testing
        sh "composer install -vvv"
        // sh "cp .env.example .env"
        // Run any static asset building, if needed
        // sh "npm install && gulp --production"
      }
    }
    
    stage('test') {
      steps {
        // Run any testing suites
        sh "./vendor/bin/phpunit ./tests"
      }
    }

    stage('sonar analysis') {
      steps {
        def scannerHome = tool name: 'sonar_scanner', type: 'hudson.plugins.sonar.SonarRunnerInstallation';
        withSonarQubeEnv('sonarqube') { 
           sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=devups-package -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000 -Dsonar.login=d3cf44aea4cc4559191e71e88b1ea38c5a596a74"
        }
      }
    }

    stage('deploy') {
      steps {
        // If we had ansible installed on the server, setup to run an ansible playbook
        // sh "ansible-playbook -i ./ansible/hosts ./ansible/deploy.yml"
        sh "echo 'WE ARE DEPLOYING'"
      }
    }

  }
  environment {
    APP_ENV = 'local'
    APP_DEBUG = 'true'
    APP_LOG_LEVEL = 'debug'
    APP_URL = 'http://localhost'
    DB_CONNECTION = 'mysql'
    DB_HOST = '127.0.0.1'
    DB_PORT = '3306'
    DB_DATABASE = ''
    DB_USERNAME = ''
    DB_PASSWORD = ''
    BROADCAST_DRIVER = 'log'
    CACHE_DRIVER = 'file'
    SESSION_DRIVER = 'file'
    QUEUE_DRIVER = 'sync'
  }
}
