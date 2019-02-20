# Scientific Enablement environment for Sightly

## Install Docker

Follow the instructions on [this page](https://docs.docker.com/install/) to install docker on your host system.

## Run the Environment

1. Clone this repository
2. Run `docker-compose up`

Postgres is listening on port 5432
Adminer can be viewed at http://localhost:8080
RStudio can be viewed at http://localhost:8787


Optionally, you can enable shiny-server by uncommenting the volume and environment lines under the rstudio service.
You'll need to have an environment variable `ADD: shiny` and port `8787:8787` and you can visit http://localhost:8787


# NOTE:

A diretory will be created within the `sightly` directory called `rstudio`. All saved R code from the user `rstudio` within the rstudio container will go here.

# CPV model is located at CPV RF Model.ipynb
