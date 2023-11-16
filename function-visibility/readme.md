## Public visibility

Public visibility is the default visibility for functions and variables. A public function can be called internally and via messages. For public state variables, Solidity automatically generates a getter function. The visibility of state variables is important because it determines how they can be accessed. For example, a public state variable has an automatically generated getter function, but a private state variable does not.

```solidity
pragma solidity ^0.4.0;

contract Simple {
    uint public x = 123;

    function addToX(uint y) public returns (uint) {
        x = x + y;
        return x;
    }
}
```

## Private visibility

Private functions and state variables are only visible for the contract they are defined in and not in derived contracts.

```solidity
pragma solidity ^0.4.0;

contract Base {
    uint private x = 123;
}

contract Derived is Base {
    function f() public {
        Base b = new Base();
        // Can't access x here because it is private
        // and only available to contract Base
        b.x();
    }
}
```

## Internal visibility

Internal functions and state variables can only be accessed internally (i.e. from within the current contract or contracts deriving from it), without using `this`.

```solidity
pragma solidity ^0.4.0;

contract Base {
    uint internal x = 123;
}

contract Derived is Base {
    function f() public {
        x = 5;
    }
}
```

## External visibility

External visibility is the default visibility for functions and variables. An external function can be called from other contracts and via transactions. If you want your contract to be able to call other contracts, you'll need to use external functions.

```solidity
pragma solidity ^0.4.0;

contract ExternalContract {
    function externalCall() external returns (uint) {
        return 123;
    }
}

contract CallingContract {
    ExternalContract ec = new ExternalContract();

    function testExternalCall() public returns (uint) {
        return ec.externalCall();
    }
}
```
