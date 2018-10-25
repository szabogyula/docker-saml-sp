# saml sp

Attribute Authorities released.

# Usage

## docker run

```bash
docker run --rm --env-file .env -p 443:442 --name saml-sp szabogyula/saml-sp
```

## docker-compose
You can use docker-compose, and read the .env.dist environment variables.

Examples in the `example` directory.

# Build

```bash
docker build -t saml-sp .
```

