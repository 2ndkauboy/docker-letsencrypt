workflow "Build Docker Image" {
  on = "push"
  resolves = ["Docker Push"]
}

action "Docker Registry" {
  uses = "actions/docker/login@fe7ed3ce992160973df86480b83a2f8ed581cd50"
  secrets = ["GITHUB_TOKEN"]
  runs = "docker.pkg.github.com"
}

action "Docker Build" {
  uses = "actions/docker/cli@fe7ed3ce992160973df86480b83a2f8ed581cd50"
  needs = ["Docker Registry"]
  runs = "build -t 2ndkauboy/docker-letsencrypt ."
}

action "Docker Tag" {
  uses = "actions/docker/tag@fe7ed3ce992160973df86480b83a2f8ed581cd50"
  needs = ["Docker Build"]
  runs = "docker-letsencrypt docker.pkg.github.com/2ndkauboy/docker-letsencrypt/docker-letsencrypt:latest"
}

action "Docker Push" {
  uses = "actions/docker/cli@fe7ed3ce992160973df86480b83a2f8ed581cd50"
  needs = ["Docker Tag"]
  runs = "push docker.pkg.github.com/2ndkauboy/docker-letsencrypt/docker-letsencrypt:latest"
}
