const hre = require("hardhat")

async function main() {
  const SolidityBasics = await hre.ethers.getContractFactory("SolidityBasics")
  const solidityBasics = await SolidityBasics.deploy()
  await solidityBasics.deployed()
  console.log("Contract deployed")
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
