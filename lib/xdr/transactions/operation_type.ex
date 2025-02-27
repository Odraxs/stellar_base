defmodule StellarBase.XDR.OperationType do
  @moduledoc """
  Representation of Stellar `OperationType` type.
  """

  @behaviour XDR.Declaration

  @declarations [
    CREATE_ACCOUNT: 0,
    PAYMENT: 1,
    PATH_PAYMENT_STRICT_RECEIVE: 2,
    MANAGE_SELL_OFFER: 3,
    CREATE_PASSIVE_SELL_OFFER: 4,
    SET_OPTIONS: 5,
    CHANGE_TRUST: 6,
    ALLOW_TRUST: 7,
    ACCOUNT_MERGE: 8,
    INFLATION: 9,
    MANAGE_DATA: 10,
    BUMP_SEQUENCE: 11,
    MANAGE_BUY_OFFER: 12,
    PATH_PAYMENT_STRICT_SEND: 13,
    CREATE_CLAIMABLE_BALANCE: 14,
    CLAIM_CLAIMABLE_BALANCE: 15,
    BEGIN_SPONSORING_FUTURE_RESERVES: 16,
    END_SPONSORING_FUTURE_RESERVES: 17,
    REVOKE_SPONSORSHIP: 18,
    CLAWBACK: 19,
    CLAWBACK_CLAIMABLE_BALANCE: 20,
    SET_TRUST_LINE_FLAGS: 21,
    LIQUIDITY_POOL_DEPOSIT: 22,
    LIQUIDITY_POOL_WITHDRAW: 23,
    INVOKE_HOST_FUNCTION: 24
  ]

  @enum_spec %XDR.Enum{declarations: @declarations, identifier: nil}

  @type t :: %__MODULE__{identifier: atom()}

  defstruct [:identifier]

  @spec new(type :: atom()) :: t()
  def new(type), do: %__MODULE__{identifier: type}

  @impl true
  def encode_xdr(%__MODULE__{identifier: type}) do
    @declarations
    |> XDR.Enum.new(type)
    |> XDR.Enum.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{identifier: type}) do
    @declarations
    |> XDR.Enum.new(type)
    |> XDR.Enum.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, spec \\ @enum_spec)

  def decode_xdr(bytes, spec) do
    case XDR.Enum.decode_xdr(bytes, spec) do
      {:ok, {%XDR.Enum{identifier: type}, rest}} -> {:ok, {new(type), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, spec \\ @enum_spec)

  def decode_xdr!(bytes, spec) do
    {%XDR.Enum{identifier: type}, rest} = XDR.Enum.decode_xdr!(bytes, spec)
    {new(type), rest}
  end
end
