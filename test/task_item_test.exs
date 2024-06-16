defmodule TaskItemTest do
  use ExUnit.Case

  test "create a task item" do
    exposed_ports = MapSet.new(["80/tcp", "443/tcp"])
    task_item = %TaskItem{
      id: "some-uuid",
      container_id: "some-container-id",
      name: "example",
      state: :running,
      image: "example/image",
      cpu: 2.0,
      memory: 1024,
      disk: 100,
      exposed_ports: exposed_ports,
      port_bindings: %{"80/tcp" => "8080", "443/tcp" => "8443"},
      restart_policy: "always",
      start_time: ~N[2024-06-16 12:00:00],
      finish_time: ~N[2024-06-16 14:00:00]
    }

    assert task_item.name == "example"
    Enum.each(task_item.port_bindings, fn {port, _host_port} ->
      assert MapSet.member?(task_item.exposed_ports, port)
    end)
  end
end
