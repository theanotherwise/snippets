
```bash
mvn clean
find . -name "pom.xml" -exec mvn clean -f {} \;
```

```bash
mvn package
```

```bash
mvn deploy
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
mvn scm:checkout -f images/application/pom.xml
```
