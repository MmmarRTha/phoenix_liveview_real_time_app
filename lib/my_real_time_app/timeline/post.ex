defmodule MyRealTimeApp.Timeline.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :username, :string, default: "martha_nieto"
    field :likes_count, :integer, default: 0
    field :reposts_count, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body])
    |> validate_required([:body])
    |> validate_length(:body, min: 2, max: 280)
  end
end
