ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Text.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Text.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Text.Repo)

