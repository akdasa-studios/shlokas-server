<a href="https://github.com/akdasa-studios/shlokas">
    <p align="center">
        <img src="https://raw.githubusercontent.com/akdasa-studios/shlokas/main/docs/logo.svg" height="184px"/>
    </p>
</a>

This repository organizes several docker containers to run the application:

1. [Database](https://github.com/akdasa-studios/shlokas-db) – database for storing user data
2. [Authentication](https://github.com/akdasa-studios/shlokas-auth) – authentication server for user login
3. [Landing](https://github.com/akdasa-studios/shlokas-landing) – landing page for the application
4. [Balancer](https://github.com/akdasa-studios/shlokas-balancer) – load balancer for the application
5. [Balancer](https://github.com/akdasa-studios/shlokas-content) – content server for the application
6. [Admin](https://github.com/akdasa-studios/shlokas-admin) – admin server for the application

## Development
Clone all the repositories related to the application. The following commands will clone all the repositories in the current directory:

```sh
gh search repos --owner akdasa-studios --match name shlokas --visibility public | while read -r repo _; do
  gh repo clone "$repo" "$repo"
done
```

#### GitHub Personal Access Token
The GitHub Personal Access Token is required to pull the images from the GitHub Container Registry. You can create a token [here](https://github.com/settings/tokens). The token should have the `packages:read` permission. After creating the token, you can set it as an environment variable. The following commands will build all the images and run the application:

```sh
export GITHUB_TOKEN=your_token
cd ./akdasa-studios/shlokas-server
./shlokas.build.sh dev
./shlokas.run.sh dev
```

‼️ Note: Without token you won't be able to build the images and you will get the following error:

```
#0 39.47 npm ERR! code E401
#0 39.47 npm ERR! 401 Unauthorized - GET https://npm.pkg.github.com/[OMITED] - unauthenticated: User cannot be authenticated with the token provided.
```


## Production

In production, all the images are pulled from the GitHub Container Registry. You can run the application using the following commands.

```sh
gh repo clone akdasa-studios/shlokas-server
cd ./shlokas-server
./shlokas.run.sh prod
```


### Watchtower
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

BALANCER_ENV=dev
```

## Updating

All the containers are updated automatically by the watchtower. But if a new container was added, you need to update the `docker-compose.yml` and cut the release. This will automatically update the repository on the server and the server will be restarted.