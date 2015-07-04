package main

import (
  "github.com/samalba/dockerclient"
  "log"
)

func main() {
  docker, _ := dockerclient.NewDockerClient("unix:///var/run/docker.sock", nil)

  containers, err := docker.ListContainers(false, false, "")
  if err != nil {
    log.Fatal(err)
  }
  for _, c := range containers {
    log.Println(c.Id, c.Names)
  }

}

