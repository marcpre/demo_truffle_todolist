pragma solidity ^0.4.17;

import "./Ownable.sol";

contract TodoList is Ownable {


    event NewTodo(uint todoId, bytes32 value);
    // event DeleteTodo(uint todoId, string value);

    //every user has an array of todo items
    mapping(uint => address) todoOwner;
    //every address has a certain number of todos on it
    mapping(address => uint) ownerTodoCount;

    TodoItem[] public todoItems;

    struct TodoItem {
        bytes32 value;
        bool active;
    }

    function createTodo(bytes32 _value) public returns(bool) {
        uint id = todoItems.push(TodoItem(_value, true)) - 1;
        todoOwner[id] = msg.sender;
        ownerTodoCount[msg.sender]++;
        NewTodo(id, _value);
        return true;
    }
    
    function getTodoItems() constant public returns (bytes32[], bool[]) {
        uint length = todoItems.length;
    
        bytes32[] memory values = new bytes32[](length);
        bool[] memory actives = new bool[](length);
    
        for (uint i = 0; i < length; i++) {
          values[i] = todoItems[i].value;
          actives[i] = todoItems[i].active;
        }
    
        return (values, actives);
    }
    
    function deleteTodoItem(uint index) public returns (bool success) {
        if (index >= todoItems.length) return;

        for (uint i = index; i < todoItems.length - 1; i++){
            todoItems[i] = todoItems[i+1];
        }

        delete todoItems[todoItems.length - 1];
        todoItems.length--;
        return true;
    }  
    
}
