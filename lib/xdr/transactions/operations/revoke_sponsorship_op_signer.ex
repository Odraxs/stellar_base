defmodule StellarBase.XDR.RevokeSponsorshipOpSigner do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `RevokeSponsorshipOpSigner` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    AccountID,
    SignerKey
  }

  @struct_spec XDR.Struct.new(
                 account_id: AccountID,
                 signer_key: SignerKey
               )

  @type account_id_type :: AccountID.t()
  @type signer_key_type :: SignerKey.t()

  @type t :: %__MODULE__{account_id: account_id_type(), signer_key: signer_key_type()}

  defstruct [:account_id, :signer_key]

  @spec new(account_id :: account_id_type(), signer_key :: signer_key_type()) :: t()
  def new(
        %AccountID{} = account_id,
        %SignerKey{} = signer_key
      ),
      do: %__MODULE__{account_id: account_id, signer_key: signer_key}

  @impl true
  def encode_xdr(%__MODULE__{account_id: account_id, signer_key: signer_key}) do
    [account_id: account_id, signer_key: signer_key]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{account_id: account_id, signer_key: signer_key}) do
    [account_id: account_id, signer_key: signer_key]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [account_id: account_id, signer_key: signer_key]}, rest}} ->
        {:ok, {new(account_id, signer_key), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [account_id: account_id, signer_key: signer_key]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)

    {new(account_id, signer_key), rest}
  end
end
