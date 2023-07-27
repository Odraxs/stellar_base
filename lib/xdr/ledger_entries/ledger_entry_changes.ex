defmodule StellarBase.XDR.LedgerEntryChanges do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `LedgerEntryChanges` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.LedgerEntryChange

  @array_type LedgerEntryChange

  @array_spec %{type: @array_type}

  @type t :: %__MODULE__{items: list(LedgerEntryChange.t())}

  defstruct [:items]

  @spec new(items :: list(LedgerEntryChange.t())) :: t()
  def new(items), do: %__MODULE__{items: items}

  @impl true
  def encode_xdr(%__MODULE__{items: items}) do
    items
    |> XDR.VariableArray.new(@array_type)
    |> XDR.VariableArray.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{items: items}) do
    items
    |> XDR.VariableArray.new(@array_type)
    |> XDR.VariableArray.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, spec \\ @array_spec)

  def decode_xdr(bytes, spec) do
    case XDR.VariableArray.decode_xdr(bytes, spec) do
      {:ok, {items, rest}} -> {:ok, {new(items), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, spec \\ @array_spec)

  def decode_xdr!(bytes, spec) do
    {items, rest} = XDR.VariableArray.decode_xdr!(bytes, spec)
    {new(items), rest}
  end
end
