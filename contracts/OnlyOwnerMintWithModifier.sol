// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";

contract OnlyOwnerMintWithModifier is ERC721 {
    /**
     * @dev
     * - このコントラクトをデプロイしたアドレス用変数
     */
    address public owner;

    constructor() ERC721("OnlyOwnerMintWithModifier", "OWNERMOD") {
        owner = _msgSender();
    }

    /**
     * @dev
     * - 取引実行者のアドレスがこのコントラクトをデプロイしたアドレスの場合のみ許可する
     */
    modifier onlyOwner() {
        require(_msgSender() == owner, "Caller is not the owner.");
        _;
    }

    /**
     * @dev
     * - 取引実行者のアドレスがこのコントラクトをデプロイしたアドレスの場合のみmint可能 onlyOwner
     * - nftMint関数の実行アドレスにtokenIdを紐付け
     */
    function nftMint(uint256 tokenId) public onlyOwner {
        _mint(_msgSender(), tokenId);
    }
}
