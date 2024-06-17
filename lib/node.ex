defmodule Node do
  defstruct [
    :name,
    :ip,
    :cores,
    :memory,
    :memory_allocated,
    :disk,
    :disk_allocated,
    :role,
    :task_count
  ]
end
