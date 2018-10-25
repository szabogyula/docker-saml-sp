# saml sp

Effective SAML SP with apache, shibboleth, php. Rich configuration via environments.

# Usage

## docker run

```bash
docker run --rm --env-file .env -p 443:442 --name saml-sp szabogyula/saml-sp
```
Configuration variables:

```
VIRTUAL_HOST=sp.example.com
ENTITY_ID=https://sp.example.com/shibboleth

# one of them
DISCOVERY_URL=https://ds.example.com/role/idp.ds
# IDP_ENTITY_ID=https://idp.example.com/ssp

SUPPORT_CONTACT=info@example.com

ALIAS_SECURE=/secure

# one of them
# XML_METADATA_PROVIDER=https://md.example.com/current/metadata.xml
DYNAMIC_METADATA_PROVIDER=http://mdx.example.com/entities/$entityID

# optional
# ATTRIBUTE_RESOLVERS=<AttributeResolver type="SimpleAggregation" attributeId="principalName" format="urn:oid:1.3.6.1.4.1.5923.1.1.1.6"><Entity>https://hexaa.eduid.hu/hexaa</Entity><Attribute Name="urn:oid:1.3.6.1.4.1.5923.1.1.1.7" NameFormat="urn:oasis:names:tc:SAML:2.0:attrname-format:uri" FriendlyName="eduPersonEntitlement"/></AttributeResolver>

# optional
# AUTHN_CONTEXT_CLASS_REF=http://mfa.eduteams.org/assurance/loa3

# optional no ssl support, no apache certs...
# NOSSL=true

# optional assertion encryption
# APPLICATION_DEFAULTS_ENCRYPTION=true
```

## docker-compose
You can use docker-compose, and read the .env.dist environment variables.

Examples in the `example` directory.

# Build

```bash
docker build -t saml-sp .
```

