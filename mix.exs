defmodule GotoFlow.MixProject do
  use Mix.Project

  def project do
    [
      app: :goto_flow,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    if Mix.env() == :test do
      [
        extra_applications: [:logger]
      ]
    else
      [
        mod: {GotoFlow.Benchmarks, []},
        extra_applications: [:logger]
      ]
    end
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:benchee, "~> 1.0"},
      {:benchee_html, "~> 1.0"}
    ]
  end
end
