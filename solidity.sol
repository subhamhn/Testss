pragma solidity ^0.4.0;

contract Test{
    uint256 public total_supply;
    string public name;
    string public symbol;
    uint256 public decimals;
    address owner;
    
    mapping(address=>uint256)balances;
    modifier Onlyowner(){
        require(owner==msg.sender);
        _;
    }
    function Test()public payable{
        total_supply=5000;
        name="s";
        symbol="$";
        decimals=0;
        balances[msg.sender]=total_supply;
    }
    function transfer(address _to,uint amount)public{
            require(amount<=total_supply);
            balances[_to]=balances[_to]+amount;
            balances[msg.sender]=balances[msg.sender]-amount;
    }
    function mint(uint256 amount)  public{
        require(amount<=total_supply);
        
        balances[msg.sender]=balances[msg.sender]+amount;
    }
    function balanceOf(address _a)public view returns(uint256){
            return balances[_a];
    }
}