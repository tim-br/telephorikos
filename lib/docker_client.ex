defmodule DockerClient do
  @docker_sock_path "/var/run/docker.sock"

  def list_containers do
    docker_url("/containers/json")
    |> HTTPoison.get([], hackney: [unix_socket: @docker_sock_path])
    |> handle_response()
  end

  def create_container(image_name, container_name) do
    body =
      Poison.encode!(%{
        "Image" => image_name
      })

    docker_url("/containers/create?name=#{container_name}")
    |> HTTPoison.post(body, [{"Content-Type", "application/json"}],
      hackney: [unix_socket: @docker_sock_path]
    )
    |> handle_response()

    ## |> case do
    ##  {:ok, %{"Id" => id}} -> start_container(id)
    ##  error -> error
    ## end
  end

  def delete_container(container_id) do
    docker_url("/containers/#{container_id}")
    |> HTTPoison.delete([], hackney: [unix_socket: @docker_sock_path])
    |> handle_start_response()
  end

  def start_container(container_id) do
    IO.puts("id")
    IO.puts(container_id)

    docker_url("/containers/#{container_id}/start")
    |> HTTPoison.post("", [], hackney: [unix_socket: @docker_sock_path])
    |> handle_start_response()
  end

  defp docker_url(endpoint) do
    "http+unix://#{URI.encode_www_form(@docker_sock_path)}#{endpoint}"
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: status_code, body: body}}) do
    IO.puts(" status code #{status_code}")
    {:ok, Poison.decode!(body)}
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: status_code, body: body}}) do
    IO.puts("Error status: #{status_code}")
    IO.puts("Error body: #{body}")
    {:error, "Received status code #{status_code}: #{body}"}
  end

  defp handle_response({:error, %HTTPoison.Error{reason: reason}}) do
    {:error, reason}
  end

  defp handle_start_response({:ok, %HTTPoison.Response{status_code: status_code, body: body}})
       when status_code in 200..299 do
    if body == "" do
      {:ok, "Container started successfully"}
    else
      {:ok, Poison.decode!(body)}
    end
  end

  defp handle_start_response({:ok, %HTTPoison.Response{status_code: status_code, body: body}}) do
    IO.puts("Error status: #{status_code}")
    IO.puts("Error body: #{body}")
    {:error, "Received status code #{status_code}: #{body}"}
  end

  defp handle_start_response({:error, %HTTPoison.Error{reason: reason}}) do
    {:error, reason}
  end
end
