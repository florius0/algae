defmodule Algae.Mixfile do
  use Mix.Project

  def project do
    [
      app: :algae,
      aliases: aliases(),
      deps: deps(),
      preferred_cli_env: [quality: :test],

      # Versions
      version: "1.3.1",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),

      # Docs
      name: "Algae",
      docs: docs(),

      # Hex
      description: "Bootstrapped algebraic data types for Elixir",
      package: package()
    ]
  end

  defp aliases do
    [
      quality: [
          "test",
          "credo --strict"
        ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:credo,       "~> 1.5",  only: [:dev, :test],        runtime: false},
      {:inch_ex,     "~> 2.0",  only: [:dev, :docs, :test], runtime: false},
      {:dialyxir,    "~> 1.1",  only: :dev,                 runtime: false},
      {:earmark,     "~> 1.4",  only: :dev,                 runtime: false},
      {:ex_doc,      "~> 0.23", only: :dev,                 runtime: false},

      {:quark,       github: "florius0/quark",      branch: "my-deps"},
      {:type_class,  github: "florius0/type_class", branch: "my-deps"},
      {:witchcraft,  github: "florius0/witchcraft", branch: "my-deps"},
    ]
  end

  defp docs do
    [
      extras: ["README.md"],
      logo: "./brand/mini-logo.png",
      main: "readme",
      source_url: "https://github.com/witchcrafters/algae"
    ]
  end

  defp package do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/witchcrafters/algae"},
      maintainers: ["Brooklyn Zelenka", "Steven Vandevelde"]
    ]
  end
end
