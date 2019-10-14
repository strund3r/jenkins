import jenkins.model.*
import hudson.security.*

def env = System.getenv()

def jenkins = Jenkins.getInstance()
jenkins.setSecurityRealm(new HudsonPrivateSecurityRealm(false))
jenkins.setAuthorizationStrategy(new GlobalMatrixAuthorizationStrategy())

def user = jenkins.getSecurityRealm().createAccount("admin", "admin@123")
user.save()

jenkins.getAuthorizationStrategy().add(Jenkins.ADMINISTER, "admin")
jenkins.save()