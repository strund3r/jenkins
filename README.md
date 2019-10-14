# Jenkins

## Run

```shell
docker run -d --name jenkins -p 80:8080 -p 50000:50000 -v <local-volume>:/var/jenkins-home -v /var/run/docker.sock:/var/run/docker.sock strund3r/jenkins
```
