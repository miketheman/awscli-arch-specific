# awscli-arch-specific

Not production grade! Reference only.

## Usage

Install the correct [`awscli`](https://docs.aws.amazon.com/cli/) for a given architecture.

Build the image like:

```bash
# Use current machine's architecture:
docker build -t awscli-arch-specific .

# Set the desired runtime architecture:
docker build -t awscli-arch-specific --platform linux/arm64 .
docker build -t awscli-arch-specific --platform linux/amd64 .
```

## Limitations

- Does not verify the binary via gpg signature
- Version is pinned in `Dockerfile`, could become an `ARG` to pass in at build time
- Does not consider multi-arch images, or `docker manifest` commands

## References

Author: [Mike Fiedler](https://github.com/miketheman)
License: [MIT](LICENSE)
