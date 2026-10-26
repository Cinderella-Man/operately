# API-only offline fixture: browser scenarios still use the original setup when enabled.
if System.get_env("EAB_API_ONLY_TESTS") != "true" do
  {:ok, _} = Application.ensure_all_started(:wallaby)
  Application.put_env(:wallaby, :base_url, OperatelyWeb.Endpoint.url())
  Application.put_env(:wallaby, :screenshot_dir, "/tmp/screenshots")
  Application.put_env(:wallaby, :screenshot_on_failure, true)
  ExUnit.configure(formatters: [JUnitFormatter, CustomFormatter, ExUnit.CLIFormatter])
end

Application.put_env(:operately, :storage_type, "local")
ExUnit.start([])
