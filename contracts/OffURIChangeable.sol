// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

// import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721URIStorage.sol";

contract OffURIChangeable is ERC721URIStorage, Ownable {
    constructor() ERC721("OffURIChangeable", "OFFC") {}

    /**
     * @dev
     * - 取引実行者のアドレスがこのコントラクトをデプロイしたアドレスの場合のみmint可能 onlyOwner
     * - nftMint関数の実行アドレスにtokenIdを紐付け
     */
    function nftMint(uint256 tokenId) public onlyOwner {
        _mint(_msgSender(), tokenId);
    }

    /**
     * @dev
     * - 既存のtokenIdにURIを紐付け
     */
    function setTokenURI(uint256 tokenId, string calldata uri)
        public
        onlyOwner
    {
        _setTokenURI(tokenId, uri);
    }
}
