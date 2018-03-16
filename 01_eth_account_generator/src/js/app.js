App = {
  web3Provider: null,
  keyParams: { keyBytes: 32, ivBytes: 16 },

  init: function() {
    return App.initWeb3();
  },

  initWeb3: function() {
    if(typeof web3 != 'undefined') {
      App.web3Provider = web3.currentProvider;
      web3 = new Web3(web3.currentProvider);
    }
    else {
      App.web3Provider = new Web3.providers.HttpProvider('https://mainnet.infura.io/');
      web3 = new Web3(App.web3Provider);
    }

    return App.createList();
  },

  createEntry: function() {
    var privKey = keythereum.create(App.keyParams).privateKey;
    var pubKey = ethereumjs.Util.privateToPublic(privKey);
    var address = '0x' + ethereumjs.Util.publicToAddress(pubKey).toString('hex');

    return {
      private: '0x' + privKey.toString('hex'),
      address: address
    }
  },

  showEntry: function() {
    var keys = App.createEntry();

    $("#priv-entry").text(keys.private);
    $("#addr-entry").text(keys.address);
    web3.eth.getBalance(keys.address, function(err, result) {
      $("#bal-entry").text(result);
    });
  },

  createList: function() {
      return App.showEntry();
  }

}

$(function() {
  $(document).ready(function() {
    App.init();
    $("#refresh-btn").click(function() {
      location.reload();
    });
  });
});
