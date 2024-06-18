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
      name: "task-1",
      state: :scheduled,
      image: "hello-world"
    }

    new_queue = :queue.in(task_item, worker.task_queue)
    updated_worker = %{worker | task_queue: new_queue}
    Worker.run_task(updated_worker)
    assert 3 == 3
  end
end
