// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");
const provider = new ethers.providers.JsonRpcProvider('https://eth-goerli.g.alchemy.com/v2/5cSDwX9imLua_LW-W_NEnZLqho_lZcJi');

async function main() {
  const slot0Bytes = await ethers.provider.getStorageAt("0xfFe2Bfe356f5F2bFC0FdF6C4185e328Ee1f5bf3f", 5);
  console.log("data", slot0Bytes);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
