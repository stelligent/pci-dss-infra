node {
   stage 'Checkout'
     git url: 'https://github.com/stelligent/pci-dss-infra.git'

   stage 'Commit'
     sh 'pipeline/run-static-analysis.sh'

   stage 'Acceptance'
     sh 'pipeline/create-infrastructure.sh'
}