defmodule Worker do
  defstruct [
    :name,
    :task_queue,
    :task_store,
    :task_count
  ]

  def collect_stats do
    IO.puts("collecting stats...")
  end

  def run_task(worker) do
    IO.puts("running task...")

    case :queue.out(worker.task_queue) do
      {:empty, _} ->
        IO.puts("No tasks in queue")

        worker

      {{:value, task}, _new_queue} ->
        IO.puts("Starting task: #{inspect(task)}")
        # Update the task queue in the worker struct
        ## worker = %{worker | task_queue: new_queue}
        worker
    end
  end

  def start_task do
    IO.puts("starting task...")
  end

  def stop_task do
    IO.puts("stopping task...")
  end
end
