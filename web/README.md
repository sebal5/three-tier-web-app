# Devops Web App

## Development

### Requirements

- [NPM](https://www.npmjs.com/): version 14 or higher
- [Terraform](https://www.terraform.io/downloads.html): Currently locked at version `1.4.2`

### App to run locally

- `npm ci`
- `npm start`

### NOTE this app uses the below env variables:

- PORT: the listening PORT
- API_HOST: the full url to call the API app

These variables need to be set

### Linting / audit / Formatting

- For NPM, use `npm run lint` & `npm audit --omit=dev`
- For Terraform, use `terraform fmt -recursive terraform/`

