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

  def run_task do
    IO.puts("running task...")
  end

  def start_task do
    IO.puts("starting task...")
  end

  def stop_task do
    IO.puts("stopping task...")
  end

end
