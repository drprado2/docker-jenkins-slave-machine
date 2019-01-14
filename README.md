# docker-jenkins-slave-machine 
[![Build Status](http://18.231.164.45:8080/buildStatus/icon?job=Teste%20Github)](http://18.231.164.45:8080/job/Teste%20Github/)
Dockerfile to generate images that will be use to up jenkins slave machines 

## How to use?

1. Build the image
* `docker image build -t jenkins-slave .`
2. Run a container instance
* `dokcer run --name jenkins-slave -d -p 50:22 -e 'SSHPASS=my_strong_password' jenkins-slave`
3. Check the container logs
* `dokcer container logs jenkins-slave`
4. Create a credential on Jenkins using the RSA PRIVATE KEY printed by logs

5. Create a id_rsa.pub file in your computer and copy to his the .pub text printed by logs

6. Add the pub credential to the jenkins user in slave container, remember that the jenkins password went set by the SSHPASS envioroment
* `ssh-copy-id -i ./id_rsa.pub jenkins@localhot -p 50`
* Digit the password equals envioroment SSHPASS
7. Now you can launch your slave machine on Jenkins                       asdasd asd asd  qwewq  qweqwe qweqw
