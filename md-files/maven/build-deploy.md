```bash
mvn clean

mvn package
```

```bash
mvn deploy # requires artifactory

mvn -Dmaven.deploy.skip deploy
mvn -Ddockerfile.skip deploy
```

```bash
mvn release:update-versions
mvn release:update-versions -DautoVersionSubmodules=true

mvn --batch-mode release:update-versions -DdevelopmentVersion=1000-SNAPSHOT
```

```bash
mvn scm:checkout
```
