defmodule WorkerTest do
  use ExUnit.Case

  test "worker, start a task" do
    worker = %Worker{
      name: "worker-1",
      task_queue: :queue.new(),
      task_store: %{},
      task_count: 0
    }

    task_item = %TaskItem{
      id: "task-id",
      name: "task_5",
      state: :scheduled,
      image: "hello-world"
    }

    new_queue = :queue.in(task_item, worker.task_queue)
    updated_worker = %{worker | task_queue: new_queue}
    updated_worker = Worker.run_task(updated_worker)
    ## temp method to simulate task running time
    :timer.sleep(1000)
    DockerClient.delete_container(updated_worker.task_store)
  end
end
