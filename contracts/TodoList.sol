pragma solidity ^0.4.17;

contract TodoList {
    TodoItem[] public todoItems;
    
    struct TodoItem {
        bytes32 value;
        //TODO submit ether to a TodoItem
        bool active;
    }
    
    function addTodoItem(bytes32 _value) returns(bool success) {
        TodoItem memory todoItem;
        todoItem.value = _value;
        todoItem.active = false;
        
        todoItems.push(todoItem);
        return true;
    }
    
    function getTodoItem() returns (bytes32[], bool[]){
        uint length = todoItems.length;
        
        //declare two arrays
        bytes32[] memory values = new bytes32[](length);
        bool[] memory actives = new bool[](length);
        
        for(uint i = 0; i < length; i++) {
            values[i] = todoItems[i].value;
            actives[i] = todoItems[i].active;
        }
        return (values, actives);
    }
    
    function deleteTodoItem(uint index) returns(bool success) {
        if(index >= todoItems.length) return;
        
        for (uint i = index; i < todoItems.length - 1; i++){
            todoItems[i] = todoItems[i+1];
        }

        delete todoItems[todoItems.length - 1];
        todoItems.length--;
        return true;
    }
}