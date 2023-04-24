pipeline{
    agent any
    tools
    {
    dockerTool "docker"
    }
    stages{
    stage('SonarQube analusis'){
            
        steps{
        withSonarQubeEnv('sonarcicd')
        {
        withMaven(maven:'mavenci')
        {
        bat "mvn sonar:sonar"
        }    
        }    
        }
        }
        stage('maven build')
        {
        steps
        {
        withMaven(maven:'mavenci')
        {
        bat "mvn clean install"
        }
        }
        }
        stage('docker build')
        {
        steps
        {
        bat 'docker build -t roomservice:latest .'
        }
        }
        
    }
}

