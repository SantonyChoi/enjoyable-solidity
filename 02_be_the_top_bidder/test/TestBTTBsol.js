var fs = require('fs');
var Web3 = require('web3');
var web3 = new Web3('http://localhost:7545');
var Contract = web3.eth.Contract;

var BTTB_json = fs.readFileSync('build/contracts/BTTB.json', 'utf8');
var BTTB_abi = JSON.parse(BTTB_json)['abi'];

var BTTB = artifacts.require("BTTB");

contract('WalletFactory test', async (accounts) => {
  it("should start a game", async () => {
    let game = await BTTB.deployed();
    let gameContract = new Contract(BTTB_abi, game.address);

    gameContract.options.gas = "100000";

    let receipt = await gameContract.methods.bid().send({
      from: accounts[1],
      value: web3.utils.toWei('1', 'ether')
    })

    let endBalance = await web3.eth.getBalance(game.address);
    assert.equal(web3.utils.toWei('0.99', 'ether'), endBalance, "99% of bidding should be remained in the contract");
  })

  it("should fail 30 times and then succeed", async() => {
    let game = await BTTB.deployed();
    let gameContract = new Contract(BTTB_abi, game.address);

    gameContract.options.gas = "100000";

    let receipt = await gameContract.methods.bid().send({
      from: accounts[1],
      value: web3.utils.toWei('2', 'ether')
    })

    let payload = {
      from: accounts[1],
    }

    for (var i = 0; i < 30; i++) {
      receipt = await gameContract.methods.finishGame().send(payload);
      assert.equal(receipt['status'], '0x00', "should failed 30 times");
    }
    receipt = await gameContract.methods.finishGame().send(payload);
    assert.equal(receipt['status'], '0x01', "should succeed at the end");
  });

  it("should fail 100 times and then succeed", async() => {
    let game = await BTTB.deployed();
    let gameContract = new Contract(BTTB_abi, game.address);

    gameContract.options.gas = "100000";

    let receipt = await gameContract.methods.bid().send({
      from: accounts[1],
      value: web3.utils.toWei('3', 'ether')
    })

    let payload = {
      from: accounts[2],
    }

    for (var i = 0; i < 100; i++) {
      receipt = await gameContract.methods.restartGame().send(payload);
      assert.equal(receipt['status'], '0x00', "should failed 30 times");
    }
    receipt = await gameContract.methods.restartGame().send(payload);
    assert.equal(receipt['status'], '0x01', "should succeed at the end");
  });
});
