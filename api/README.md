# Devops API App

## Development

### Requirements

- [NPM](https://www.npmjs.com/): version 14 or higher
- [Terraform](https://www.terraform.io/downloads.html): Currently locked at version `1.4.2`

### App to run locally

- `npm ci`
- `npm start`

### NOTE this app uses the below env variables:

- PORT: the listening PORT
- DB: Name of the database to connect
- DBUSER: Database user
- DBPASS: DB user password,
- DBHOST: Database hostname,
- DBPORT: Database server listening port

These variables need to be set

### Linting / audit / Formatting

- For NPM, use `npm run lint` & `npm audit --omit=dev`
- For Terraform, use `terraform fmt -recursive terraform/`


