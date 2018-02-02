pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/TodoList.sol";

contract TestTodoList {
    TodoList todolist = TodoList(DeployedAddresses.TodoList());

    // Testing the adopt() function
    function testUserCanAddTodo() public {
      bool returnedTodo = todolist.createTodo("test");

      bool expectedValue = true;
    
      Assert.equal(returnedTodo, expectedValue, "Todo should be added to the list and return 1.");
    }

    // Testing retrieval of all todos
/*    function testGetAllTodos() public {
      bool returnedTodo = todolist.getTodoItems();
      
    }
*/
  
    // Testing retrieval of all todos
    function testdeleteTodoItem() public {
      todolist.createTodo("test");
      todolist.createTodo("test");

      bool returnedTodo = todolist.deleteTodoItem(1);

      bool expectedValue = true;
    
      Assert.equal(returnedTodo, expectedValue, "Todo was deleted.");

    }
      
}