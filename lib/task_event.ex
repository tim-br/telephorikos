defmodule TaskEvent do
  defstruct [
    :id,
    :state,
    :timestamp,
    :task_item
  ]
end
