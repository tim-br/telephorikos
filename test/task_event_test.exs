defmodule TaskEventTest do
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

    task_event = %TaskEvent{
      id: "next-uuid",
      state: :failed,
      timestamp: ~N[2024-06-16 12:00:00],
      task_item: task_item
    }

    assert task_event.id == "next-uuid"
    assert task_event.state == :failed
    assert task_event.task_item.name == "example"
  end
end
