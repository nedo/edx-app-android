#!/usr/bin/env groovy

def runCommandInMyEnvironment(cmd) {
  sh "virtualenv automation; source automation/bin/activate; ${cmd}"
}

pipeline {
    agent {
     label 'android-worker'
    }

    environment {
            PIPELINE_JOBS_NAME = 'edx-app-android-pipeline'
            ANDROID_HOME = '/opt/android-sdk-linux'
            APK_PATH = 'OpenEdXMobile/build/outputs/apk/prod/debuggable'
            CONFIG_REPO_NAME = 'edx-mobile-config'
    }       
    stages {
        
        // stage('set up virtual env') { 
        //     steps {
        //        virtualenv {
        //            pythonName('System-CPython-2.7')
        //            nature("shell")
        //            systemSitePackages(false)
        //            command(readFileFromWorkspace('resources/MckinseyCI.sh'))
        //             }
        //        }
        // }




    //     stage('checkingout configs') { 
    //         steps {
    //             sh 'mkdir -p edx-mobile-config'
    //             dir('edx-mobile-config'){
    //                 sshagent(credentials: ['jenkins-worker', 'jenkins-worker-pem'], ignoreMissing: true) {
    //                 checkout changelog: false, poll: false, scm: [
    //                     $class: 'GitSCM', 
    //                     branches: 
    // // Using specific branch to avoid Firebase config limitations
    //                             //[[name: '*/master']],
    //                             [[name: 'naveed/automation_configs']],
    //                     doGenerateSubmoduleConfigurations: false, 
    //                     extensions: 
    //                             [[$class: 'CloneOption', honorRefspec: true,
    //                                 noTags: true, shallow: true]], 
    //                     submoduleCfg: [], 
    //                     userRemoteConfigs: 
    //                                 [[credentialsId: 'jenkins-worker',
    //                                 refspec: '+refs/heads/*:refs/remotes/origin/*', 
    //                                 url: "git@github.com:edx/${CONFIG_REPO_NAME}.git"]]
    //                         ]
    //                 }
    //             }
    //         }
    //     }

        // stage('checkingout configs') {
        //     steps {
        //         sh 'mkdir -p edx-mobile-config'
        //         dir('edx-mobile-config'){
        //             checkout([
        //                 $class: 'GitSCM', 
        //                 branches: [[name: 'naveed/automation_configs']], 
        //                 doGenerateSubmoduleConfigurations: false, 
        //                 extensions: [], 
        //                 submoduleCfg: [], 
        //                 userRemoteConfigs: 
        //                 [[credentialsId: 'USER', url: 'https://github.com/edx/edx-mobile-config']]
        //                 ])
        //         }
        //     }
        // }

        stage('compiling edx-app-android') {
            steps {
                writeFile file: './OpenEdXMobile/edx.properties', text: 'edx.dir = \'../edx-mobile-config/prod/\''  
                // sh 'bash ./resources/compile_android.sh'
                runCommandInMyEnvironment('bash ./resources/compile_android.sh') {
            }
        }
        stage('valdiate compiled app') {
            steps {
                // sh 'bash ./resources/validate_builds.sh'
                runCommandInMyEnvironment('bash ./resources/validate_builds.sh')
            }
        }
        // stage('archive the build') {
        //     steps {
        //         archiveArtifacts artifacts: "$APK_PATH/*.apk", onlyIfSuccessful: true
        //     }
        // }

        // stage('setup emulator '){
        //    steps {         
        //        sh 'pwd'      
        //        sh 'bash ./resources/setup_emulator.sh'
        //        } 
        // }

        // stage('checkout test repo') {
        //     steps {
        //         checkout([$class: 'GitSCM', branches: [[name: 'naveed/LEARNER-7121']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/edx/edx-app-test.git']]]
        //         )
        //     }
        // }

        // stage('install pre-reqs '){
        //    steps {               
        //         sh '/usr/bin/npm install -g appium --unsafe-perm=true --allow-root'
        //         sh 'appium'
        //         sh '/usr/local/bin/pip install -r requirements.txt'
        //         sh '/usr/local/bin/pip list'
        //        } 
        // }

        // stage('start execution') {
        //     steps {
        //         // sh "ANDROID_HOME/platform-tools/adb install $APK_PATH/*.apk"
        //         sh 'bash ./resources/execute_testing.sh'
                
        //     }
        // }

    }
} 
