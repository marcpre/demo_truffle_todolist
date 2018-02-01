pragma solidity ^ 0.4.17;

contract TodoList {

    event NewTodo(uint todoId, string value);
    event DeleteTodo(uint todoId, string value);

    mapping(uint => address) public todoOwner;
    mapping(address => uint) ownerTodoCount;

    TodoItem[] public todoItems;

    struct TodoItem {
        string value;
        //TODO submit ether to a TodoItem
        bool active;
    }

    function createTodo(string _value) internal {
        uint id = todoItems.push(TodoItem(_value, true)) - 1;
        todoOwner[id] = msg.sender;
        ownerTodoCount[msg.sender]++;
        NewTodo(id, _value);
    }
    
    //function deleteTodo;
    
    //function getAllTodos
    
    //function getTodoById
    
}
