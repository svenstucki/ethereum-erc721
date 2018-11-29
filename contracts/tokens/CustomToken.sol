pragma solidity ^0.4.24;

import "./NFTokenMetadata.sol";

contract CustomToken is NFTokenMetadata {
  address public owner;

  constructor(string _name, string _symbol) public {
    owner = msg.sender;

    nftName = _name;
    nftSymbol = _symbol;
  }

  // owner can mint arbitrary tokens
  function mint(address _owner, uint256 _id, string _uri) external {
    require(msg.sender == owner);
    super._mint(_owner, _id);
    super._setTokenUri(_id, _uri);
  }

  // owner can burn arbitrary tokens
  function burn(address _owner, uint256 _tokenId) external {
    require(msg.sender == owner);
    super._burn(_owner, _tokenId);
  }

  // allow change of ownership (simple version without events)
  function changeOwner(address _owner) external {
    require(msg.sender == owner);
    owner = _owner;
  }
}
