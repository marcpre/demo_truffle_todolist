pragma solidity ^0.4.17;

import "./Ownable.sol";

contract TodoList is Ownable {

    event NewTodo(uint todoId, string value);
    event DeleteTodo(uint todoId, string value);

    //every user has an array of todo items
    mapping(uint => address) todoOwner;
    //every address has a certain number of todos on it
    mapping(address => uint) ownerTodoCount;

    TodoItem[] public todoItems;

    struct TodoItem {
        string value;
        bool active;
    }

    function createTodo(string _value) public returns(uint) {
        uint id = todoItems.push(TodoItem(_value, true)) - 1;
        todoOwner[id] = msg.sender;
        ownerTodoCount[msg.sender]++;
        NewTodo(id, _value);
        return id;
    }
}
