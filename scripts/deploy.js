const fs = require('fs');
const Web3 = require('web3');
const web3 = new Web3('https://rinkeby.infura.io/v3/bfd2419d8f3242d494de2fc399e01c34');
const bytecode = fs.readFileSync('./build/FirstContract.bin');
const abi = JSON.parse(fs.readFileSync('./build/FirstContract.abi'));

(async function () {
  const ganacheAccounts = await web3.eth.getAccounts();
  const myWalletAddress = ganacheAccounts[0];

  const myContract = new web3.eth.Contract(abi);

  myContract.deploy({
    data: bytecode.toString()
  }).send({
    from: myWalletAddress,
    gas: 5000000
  }).then((deployment) => {
    console.log('FirstContract was successfully deployed!');
    console.log('FirstContract can be interfaced with at this address:');
    console.log(deployment.options.address);
  }).catch((err) => {
    console.error(err);
  });
})();