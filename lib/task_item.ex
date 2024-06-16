defmodule TaskItem do
  defstruct [
    :id,
    :container_id,
    :name,
    :state,
    :image,
    :cpu,
    :memory,
    :disk,
    :exposed_ports,
    :port_bindings,
    :restart_policy,
    :start_time,
    :finish_time
  ]
end
