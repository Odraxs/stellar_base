defmodule StellarBase.XDR.ConfigSetting do
  @moduledoc """
  Representation of Stellar `ConfigSetting` type.
  """

  alias StellarBase.XDR.{UInt32, ConfigSettingType}

  @behaviour XDR.Declaration

  @arms [CONFIG_SETTING_TYPE_UINT32: UInt32]

  @type value :: UInt32.t()

  @type t :: %__MODULE__{value: value(), type: ConfigSettingType.t()}

  defstruct [:value, :type]

  @spec new(value :: value(), type :: ConfigSettingType.t()) :: t()
  def new(value, %ConfigSettingType{} = type), do: %__MODULE__{value: value, type: type}

  @impl true
  def encode_xdr(%__MODULE__{value: value, type: type}) do
    type
    |> XDR.Union.new(@arms, value)
    |> XDR.Union.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{value: value, type: type}) do
    type
    |> XDR.Union.new(@arms, value)
    |> XDR.Union.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, spec \\ union_spec())

  def decode_xdr(bytes, spec) do
    case XDR.Union.decode_xdr(bytes, spec) do
      {:ok, {{type, value}, rest}} -> {:ok, {new(value, type), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, spec \\ union_spec())

  def decode_xdr!(bytes, spec) do
    {{type, value}, rest} = XDR.Union.decode_xdr!(bytes, spec)
    {new(value, type), rest}
  end

  @spec union_spec() :: XDR.Union.t()
  defp union_spec do
    nil
    |> ConfigSettingType.new()
    |> XDR.Union.new(@arms)
  end
end
