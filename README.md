<a href="https://github.com/akdasa-studios/shlokas">
    <p align="center">
        <img src="https://raw.githubusercontent.com/akdasa-studios/shlokas/main/docs/logo.svg" height="184px"/>
    </p>
</a>

# Configuration
This server organizes several docker containers to run the application:

1. [Database](https://github.com/akdasa-studios/shlokas-db) – database for storing user data
2. [Authentication](https://github.com/akdasa-studios/shlokas-auth) – authentication server for user login
3. [Landing](https://github.com/akdasa-studios/shlokas-landing) – landing page for the application
4. [Balancer](https://github.com/akdasa-studios/shlokas-balancer) – load balancer for the application

## Watchtower
[Watchtower](https://containrrr.dev/watchtower/) is a tool that automatically updates running docker containers. It is configured to run on the host machine and update the containers on the docker network. It requires an authentication token to access the docker registry. The token is stored in the `config.json` file in the root directory of the project.

```json5
// config.json
{
  "auths": {
    "ghcr.io": {
      // echo -n 'github_username:github_personal_token' | base64
      "auth": "AUTH_STRING",
    }
  }
}
```

## Environment Variables
The following environment variables are used by the server. They are stored in the `environment.env` file in the root directory of the project. You can override these values by creating an `environment.local.env` file.

```bash
# Server settings: dev or prod
ENV=dev

# Database settings
COUCHDB_USER=dev
COUCHDB_PASSWORD=dev
COUCHDB_HOST=db
SHLOKAS_USERS_DB=users_shlokas

# Email settings for sending emails
SHLOKAS_EMAIL=email@from.app
SHLOKAS_EMAIL_PASSWORD=password
```

# Installation

1. Clone the repository
2. Modify the `config.json` and create an `environment.local.env` file
3. Run `docker-compose up -d` to start the server


# Updating

All the containers are updated automatically by the watchtower. But if a new container was added, you need to update the `docker-compose.yml` and cut the release. This will automatically update the repository on the server and the server will be restarted.