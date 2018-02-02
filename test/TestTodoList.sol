pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/TodoList.sol";

contract TestTodoList {
    TodoList todolist = TodoList(DeployedAddresses.TodoList());

    // Testing the adopt() function
    function testUserCanAddTodo() public {
      uint returnedTodo = todolist.createTodo("test");

      uint expectedValue = 1;
    
      Assert.equal(returnedTodo, expectedValue, "Todo should be added to the list and return 1.");
    }

/*    
    // Testing retrieval of a single todo
    function testGetTodoById() public {

    }

    // Testing retrieval of all todos
    function testGetTodoList() public {

    }
*/    
}
