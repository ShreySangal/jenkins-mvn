node ('docker-slave'){

    stage('SCM') {
    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/shreys-s/game-of-life.git']]])
    }
    
    stage('Build') {
                sh 'mvn clean package'
    }
    stage('Junit')
    {
        junit '**/target/surefire-reports/*.xml'
    }
    stage('SonarQube analysis') {
        withSonarQubeEnv('sonarqube') {
            sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.2:sonar'
        }
  }
  stage('Artifacts')
  {
    archiveArtifacts '**/target/*.*ar'
  }
  stage('Publish') {
    nexusArtifactUploader artifacts: [[artifactId: 'gameoflife', classifier: '', file: 'gameoflife-web/target/gameoflife.war', type: 'war']], credentialsId: 'nexus', groupId: '', nexusUrl: '172.17.0.3:8081/nexus', nexusVersion: 'nexus2', protocol: 'http', repository: 'dryice', version: '1.0'
   }
   stage('Deployment'){
    build job: 'deployment', parameters: [string(name: 'artifact', value: 'gameoflife')]
   }
}
