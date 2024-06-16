defmodule Manager do
  defstruct [
    :pending,
    :task_store,
    :event_store,
    :workers,
    :workers_task_map,
    :task_worker_map
  ]

  def select_worker do
    IO.puts("selecting worker...")
  end

  def update_tasks do
    IO.puts("updating tasks...")
  end

  def send_work do
    IO.puts("sending work...")
  end

end
