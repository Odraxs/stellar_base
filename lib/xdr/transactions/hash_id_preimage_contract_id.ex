defmodule StellarBase.XDR.HashIDPreimageContractID do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `HashIDPreimageContractID` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Hash,
    ContractIDPreimage
  }

  @struct_spec XDR.Struct.new(
                 network_id: Hash,
                 contract_id_preimage: ContractIDPreimage
               )

  @type network_id_type :: Hash.t()
  @type contract_id_preimage_type :: ContractIDPreimage.t()

  @type t :: %__MODULE__{
          network_id: network_id_type(),
          contract_id_preimage: contract_id_preimage_type()
        }

  defstruct [:network_id, :contract_id_preimage]

  @spec new(network_id :: network_id_type(), contract_id_preimage :: contract_id_preimage_type()) ::
          t()
  def new(
        %Hash{} = network_id,
        %ContractIDPreimage{} = contract_id_preimage
      ),
      do: %__MODULE__{network_id: network_id, contract_id_preimage: contract_id_preimage}

  @impl true
  def encode_xdr(%__MODULE__{network_id: network_id, contract_id_preimage: contract_id_preimage}) do
    [network_id: network_id, contract_id_preimage: contract_id_preimage]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{network_id: network_id, contract_id_preimage: contract_id_preimage}) do
    [network_id: network_id, contract_id_preimage: contract_id_preimage]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok,
       {%XDR.Struct{
          components: [network_id: network_id, contract_id_preimage: contract_id_preimage]
        }, rest}} ->
        {:ok, {new(network_id, contract_id_preimage), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{
       components: [network_id: network_id, contract_id_preimage: contract_id_preimage]
     }, rest} = XDR.Struct.decode_xdr!(bytes, struct)

    {new(network_id, contract_id_preimage), rest}
  end
end
