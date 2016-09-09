# Docker + Jenkins

## Introduction

This example Dockerizes Jenkins. Several concepts are illustrated here:
* using an official image to get started faster
* Copying files over to the image
* Customizing the Jenkins with our specific settings.

These points help us move toward creating idempotent containers; i.e
* This Jenkins image will create containers that contain the exact configuration you want, every time.
