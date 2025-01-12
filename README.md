# Secure Webhook Gateway

A robust Go service designed to act as a secure webhook gateway with HMAC signature verification. This service provides a secure way to validate incoming webhook requests and process them accordingly.

## Features

- **HMAC Signature Verification**: Validates incoming webhook requests using SHA-256 HMAC signatures
- **JSON Payload Validation**: Automatically validates JSON payloads
- **Configurable Headers**: Customizable header names for signature verification
- **Health Check Endpoint**: Built-in health check endpoint for monitoring
- **Detailed Logging**: Comprehensive request logging with timestamps and client information
- **Environment Variable Configuration**: Easy configuration through environment variables

## Prerequisites

- Go 1.16 or higher
- Make (for building)

## Building Instructions

```bash
make build
```

This will create a `bin/webhook-interceptor` executable.

## Configuration

Set the following environment variables before running:

- `WEBHOOK_SECRET`: Your webhook secret key for HMAC verification
- `HEADER`: The header name containing the signature (default: X-Hub-Signature)

Example:
```bash
export WEBHOOK_SECRET="your-secret-key"
export HEADER="X-Hub-Signature"
```

## Running the Service

```bash
bin/webhook-interceptor
```

The service will start on port 8080 by default.

## Testing the Service

You can test the webhook endpoint using curl:

```bash
curl -v \
-H 'X-Hub-Signature: sha256=eff49d9c699ae04340f1a9a6e1800a7d018864c88ca719e0156ca7a9a55b0f67' \
-d '{"test": 123}' \
http://localhost:8080/test
```

## Available Endpoints

- `POST /test`: Webhook endpoint for receiving and validating webhooks
- `GET /health`: Health check endpoint

## Development

### Running Tests
```bash
make test
```

### Code Formatting
```bash
make fmt
```

### Code Validation
```bash
make vet
```

### Integration Tests
```bash
make integration_test
```

## Security

The service uses HMAC-SHA256 for signature verification, ensuring that only requests with valid signatures are processed. The signature should be provided in the configured header (default: X-Hub-Signature) in the format:

```
sha256=<signature>
```

## License

This project is licensed under the terms of the included LICENSE file.
