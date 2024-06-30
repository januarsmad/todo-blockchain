// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./TodoFactory.sol";
import "./TodoInterface.sol";

contract StorageFactory {
    
    TodoFactory[] public todoArray;

    function createTodoContract() public {
        TodoFactory todo = new TodoFactory();
        todoArray.push(todo);
    }

    function sfCreateTodo(uint256 _todoIndex, string memory _task, uint256 _severity) public {
        todoArray[_todoIndex].createTodo(_task, _severity);
    }


    function sfGetTodo(uint256 _storageIndex, uint256 _todoIndex) public view returns (ITodo.Todo memory) {
        return todoArray[_storageIndex].retrieveTodo(_todoIndex);
    }

    function sfGetTodoById(uint256 _todoIndex, uint256 _id) public view returns (
        uint256 id,
        string memory task,
        uint256 severity,
        bool isCompleted
    ) {
        return todoArray[_todoIndex].getTodoById(_id);
    }
}