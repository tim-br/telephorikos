# Telephorikos

Telephorikos is an Elixir project designed to manage job tasks with detailed attributes including container ID, state, image, resource allocations, and port configurations. The project includes functionalities for creating, managing, and validating job tasks.

## Installation

### Prerequisites

- Elixir (version 1.16.2 or later)
- Erlang/OTP (version 26 or later)
- Docker

Ensure that the docker api is running and available at 
`/var/run/docker.sock`. IMPORTANT: Tests will not pass if this file is not available.
### Steps

1. **Clone the repository:**

   ```sh
   git clone https://github.com/tim-br/telephorikos.git
   cd telephorikos

2. Install dependencies:

```sh
mix deps.get
```

3. Run tests to ensure everything is set up correctly:

```sh
mix test
```

### Docker Client module

You must have a local image pulled for testing. IE

```bash
docker pull nginx  
```

Use the Docker Client in iex:

In the iex session, you can now use the Docker client module to list containers and create new ones.

```bash
iex -S mix
```

Create and Start an Nginx Container:

```elixir
DockerClient.create_container("nginx")
```
This command will create and start a new container with the Nginx image.

List Containers:

```elixir
DockerClient.list_containers()
```
This command will list all running Docker containers.